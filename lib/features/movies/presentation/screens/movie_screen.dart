import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_flutter/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:movie_flutter/features/movies/presentation/components/now_playing_component.dart';
import 'package:movie_flutter/features/movies/presentation/components/popular_component.dart';
import 'package:movie_flutter/features/movies/presentation/components/top_rated_component.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_bloc.dart';
import 'package:movie_flutter/features/movies/presentation/controller/movies/movies_event.dart';

import '../../../../core/di/injection.dart';
import '../components/movie_section_header.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_selectedIndex == 0 ? 'Movies' : 'Favorites')),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [_MoviesHomeTab(), FavoritesScreen()],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            selectedIcon: Icon(Icons.movie),
            label: 'Movies',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

class _MoviesHomeTab extends StatelessWidget {
  const _MoviesHomeTab();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (_) => sl<MoviesBloc>()
        ..add(const NowPlayingMoviesEvent())
        ..add(const PopularMoviesEvent())
        ..add(const TopRatedMoviesEvent()),
      child: const SingleChildScrollView(
        key: PageStorageKey('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSectionHeader(title: 'Now Playing'),
            NowPlayingComponent(),

            MovieSectionHeader(title: 'Popular'),
            PopularComponent(),

            MovieSectionHeader(title: 'Top Rated'),
            TopRatedComponent(),
          ],
        ),
      ),
    );
  }
}
