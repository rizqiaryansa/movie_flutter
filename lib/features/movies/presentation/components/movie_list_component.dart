import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/utils/enums.dart';
import '../controller/movies/movie_section_state.dart';
import '../screens/movie_detail_screen.dart';

class MovieListComponent extends StatelessWidget {
  final MovieSectionState section;

  const MovieListComponent({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    switch (section.requestState) {
      case RequestState.loading:
        return const SizedBox(
          height: 300,
          child: Center(child: CircularProgressIndicator()),
        );

      case RequestState.loaded:
        if (section.movies.isEmpty) {
          return const _SectionEmptyState(child: Text('No movies available'));
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth * 0.75;
            final imageHeight = itemWidth * 9 / 16;

            const imageTitleGap = 8.0;
            const titleFontSize = 16.0;
            const titleLineHeight = 1.2;
            const titleAreaHeight = titleFontSize * titleLineHeight * 2;

            return SizedBox(
              height: imageHeight + imageTitleGap + titleAreaHeight,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: section.movies.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 12);
                },
                itemBuilder: (context, index) {
                  final movie = section.movies[index];

                  return Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      key: ValueKey(movie.id),
                      width: itemWidth,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (_) => MovieDetailScreen(id: movie.id),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: ApiConstants.imageUrl(
                                          movie.backdropPath,
                                        ),
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) {
                                          return ColoredBox(
                                            color: Colors.grey.shade900,
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        },
                                        errorWidget: (context, url, error) {
                                          return ColoredBox(
                                            color: Colors.grey.shade900,
                                            child: const Center(
                                              child: Icon(Icons.broken_image),
                                            ),
                                          );
                                        },
                                      ),
                                      Positioned(
                                        top: 8,
                                        right: 8,
                                        child: _RatingBadge(
                                          rating: movie.voteAverage,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: imageTitleGap),
                              Text(
                                movie.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: titleFontSize,
                                  height: titleLineHeight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );

      case RequestState.error:
        return SizedBox(
          height: 300,
          child: Center(child: Text(section.message)),
        );
    }
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;

  const _RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.72),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, size: 16, color: Colors.amber),
            const SizedBox(width: 4),
            Text(
              rating.toStringAsFixed(1),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionEmptyState extends StatelessWidget {
  final Widget child;

  const _SectionEmptyState({required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 300, child: Center(child: child));
  }
}
