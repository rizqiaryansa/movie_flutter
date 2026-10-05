import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/network/api_constants.dart';
import '../../../../core/utils/enums.dart';
import '../../../movies/presentation/screens/movie_detail_screen.dart';
import '../../domain/entities/favorite_movie.dart';
import '../controller/favorites_cubit.dart';
import '../controller/favorites_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (_) => sl<FavoritesCubit>()..watchFavorites(),
      child: const _FavoritesView(),
    );
  }
}

class _FavoritesView extends StatelessWidget {
  const _FavoritesView();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listenWhen: (previous, current) =>
          previous.message != current.message &&
          current.message.isNotEmpty &&
          current.requestState == RequestState.loaded,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.message)));
      },
      builder: (context, state) {
        return switch (state.requestState) {
          RequestState.loading => const Center(
            child: CircularProgressIndicator(),
          ),
          RequestState.error => _FavoritesError(message: state.message),
          RequestState.loaded =>
            state.movies.isEmpty
                ? const _EmptyFavorites()
                : _FavoritesList(movies: state.movies),
        };
      },
    );
  }
}

class _FavoritesList extends StatelessWidget {
  final List<FavoriteMovie> movies;

  const _FavoritesList({required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      key: const PageStorageKey('favoritesList'),
      padding: const EdgeInsets.all(16),
      itemCount: movies.length,
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _FavoriteMovieCard(movie: movie);
      },
    );
  }
}

class _FavoriteMovieCard extends StatelessWidget {
  final FavoriteMovie movie;

  const _FavoriteMovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    final releaseYear = DateTime.tryParse(movie.releaseDate)?.year.toString();

    return SizedBox(
      height: 130,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => MovieDetailScreen(id: movie.id),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 140,
                child: movie.backdropPath.isEmpty
                    ? const _ImageFallback()
                    : CachedNetworkImage(
                        imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                        fit: BoxFit.cover,
                        placeholder: (_, _) => const _ImagePlaceholder(),
                        errorWidget: (_, _, _) => const _ImageFallback(),
                      ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 12,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 4),
                              Text(movie.voteAverage.toStringAsFixed(1)),
                            ],
                          ),
                          if (releaseYear != null) Text(releaseYear),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  tooltip: 'Remove from favorites',
                  onPressed: () {
                    context.read<FavoritesCubit>().removeFavorite(movie.id);
                  },
                  icon: const Icon(Icons.favorite, color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No favorite movies yet',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              'Open a movie and tap the heart to save it here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritesError extends StatelessWidget {
  final String message;

  const _FavoritesError({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 48),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: () {
                context.read<FavoritesCubit>().watchFavorites();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(child: Icon(Icons.broken_image_outlined)),
    );
  }
}
