import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/features/movies/presentation/components/movie_list_component.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movie_section_state.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_bloc.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_state.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MoviesBloc, MoviesState, MovieSectionState>(
      selector: (state) => state.nowPlaying,
      builder: (context, section) {
        return MovieListComponent(section: section);
      },
    );
  }
}
