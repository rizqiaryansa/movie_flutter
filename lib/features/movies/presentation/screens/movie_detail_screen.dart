import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/core/network/api_constants.dart';
import 'package:movie_flutter/core/utils/enums.dart';
import 'package:movie_flutter/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_flutter/features/movies/presentation/controller/moviedetail/movie_detail_bloc.dart';
import 'package:movie_flutter/features/movies/presentation/controller/moviedetail/movie_detail_event.dart';
import 'package:movie_flutter/features/movies/presentation/controller/moviedetail/movie_detail_state.dart';

import '../../../../core/di/injection.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieDetailBloc>()..add(MovieDetailRequested(id)),
      child: MovieDetailContent(movieId: id),
    );
  }
}

class MovieDetailContent extends StatelessWidget {
  final int movieId;

  const MovieDetailContent({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailBloc, MovieDetailState>(
      listenWhen: (previous, current) =>
          previous.favoriteMessage != current.favoriteMessage &&
          current.favoriteMessage.isNotEmpty,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.favoriteMessage)));
      },
      builder: (context, state) {
        return switch (state.movieDetailState) {
          RequestState.loading => const _LoadingView(),
          RequestState.error => _ErrorView(
            message: state.movieDetailMessage,
            onRetry: () {
              context.read<MovieDetailBloc>().add(
                MovieDetailRequested(movieId),
              );
            },
          ),
          RequestState.loaded => _buildLoadedView(context, state),
        };
      },
    );
  }

  Widget _buildLoadedView(BuildContext context, MovieDetailState state) {
    final movie = state.movieDetail;
    if (movie == null) {
      return const _ErrorView(message: 'Movie details are unavailable.');
    }

    return _MovieDetailView(
      movie: movie,
      isFavorite: state.isFavorite,
      isFavoriteUpdating: state.isFavoriteUpdating,
      onFavoritePressed: () {
        context.read<MovieDetailBloc>().add(const MovieFavoriteToggled());
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const _ErrorView({required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final displayMessage = message.trim().isEmpty
        ? 'Something went wrong. Please try again.'
        : message;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48),
              const SizedBox(height: 16),
              Text(displayMessage, textAlign: TextAlign.center),
              if (onRetry != null) ...[
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Try again'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MovieDetailView extends StatelessWidget {
  final MovieDetail movie;
  final bool isFavorite;
  final bool isFavoriteUpdating;
  final VoidCallback onFavoritePressed;

  const _MovieDetailView({
    required this.movie,
    required this.isFavorite,
    required this.isFavoriteUpdating,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: const Key('movieDetailScrollView'),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 280,
            actions: [
              IconButton(
                onPressed: isFavoriteUpdating ? null : onFavoritePressed,
                tooltip: isFavorite
                    ? 'Remove from favorites'
                    : 'Add to favorites',
                icon: isFavoriteUpdating
                    ? const SizedBox.square(
                        dimension: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.redAccent : null,
                      ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: FadeIn(
                duration: const Duration(milliseconds: 400),
                child: _BackdropImage(movie: movie),
              ),
            ),
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: FadeInUp(
                  from: 16,
                  duration: const Duration(milliseconds: 400),
                  child: _MovieInformation(movie: movie),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackdropImage extends StatelessWidget {
  final MovieDetail movie;

  const _BackdropImage({required this.movie});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Semantics(
      image: true,
      label: '${movie.title} backdrop image',
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (movie.backdropPath.isEmpty)
            const _ImageFallback()
          else
            CachedNetworkImage(
              imageUrl: ApiConstants.imageUrl(movie.backdropPath),
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, progress) {
                return Center(
                  child: CircularProgressIndicator(value: progress.progress),
                );
              },
              errorWidget: (context, url, error) {
                return const _ImageFallback();
              },
            ),
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, backgroundColor],
                stops: const [0.55, 1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: const Center(child: Icon(Icons.broken_image_outlined, size: 56)),
    );
  }
}

class _MovieInformation extends StatelessWidget {
  final MovieDetail movie;

  const _MovieInformation({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final releaseDate = movie.releaseDate;
    final duration = _formatDuration(movie.runtime);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 8,
          children: [
            _MovieInfoBadge(label: releaseDate),
            _MovieInfoBadge(
              icon: Icons.star,
              iconColor: Colors.amber,
              label: '${movie.voteAverage.toStringAsFixed(1)}/10',
            ),
            if (duration != null)
              _MovieInfoBadge(icon: Icons.schedule, label: duration),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Overview',
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          movie.overview.trim().isEmpty
              ? 'No overview is available.'
              : movie.overview,
          style: textTheme.bodyMedium?.copyWith(height: 1.5),
        ),
        const SizedBox(height: 24),
        Text(
          'Genres',
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        if (movie.genres.isEmpty)
          Text('Not available', style: textTheme.bodyMedium)
        else
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: movie.genres
                .map((genre) => Chip(label: Text(genre.name)))
                .toList(),
          ),
      ],
    );
  }
}

class _MovieInfoBadge extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? iconColor;

  const _MovieInfoBadge({required this.label, this.icon, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 17, color: iconColor),
              const SizedBox(width: 5),
            ],
            Text(label),
          ],
        ),
      ),
    );
  }
}

String? _formatDuration(int runtime) {
  if (runtime <= 0) return null;

  final hours = runtime ~/ 60;
  final minutes = runtime % 60;

  if (hours == 0) return '${minutes}m';
  if (minutes == 0) return '${hours}h';

  return '${hours}h ${minutes}m';
}
