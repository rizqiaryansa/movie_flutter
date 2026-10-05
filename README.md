# Movie Flutter

This is my playground for building a Flutter Movie app with Clean Architecture,
Bloc/Cubit, dependency injection, and local persistence through Drift's typed
SQLite API. I started this project to see how an Android-style architecture works in Flutter.

## Preview
![Movie Flutter screens](https://github.com/rizqiaryansa/movie_flutter/blob/main/images/movie_flutter.gif)


## Features

- Movie List: Now Playing, Popular, and Top Rated movie sections (including: loading, empty and error states)
- A movie detail screen with release year, rating, runtime, overview, and genres
- Add/remove favorite actions from the detail screen using Drift as Typed SQLite
- Unit, database, and widget tests

## Tech Stack

| Used for              | Packages                                | Purpose                                                                                          |
|-----------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------|
| State management      | `flutter_bloc`, `bloc_concurrency`      | Bloc for event-driven flows, Cubit for simpler commands, and `restartable()` for detail requests |
| Dependency injection  | `get_it`, `injectable`                  | To manage object creation and provide dependencies automatically                                 |
| Networking            | `dio`                                   | TMDB requests, timeouts, and API configuration                                                   |
| JSON                  | `json_annotation`, `json_serializable`  | Generated parsing for API response models                                                        |
| Local database        | `drift`, `drift_flutter`                | Typed SQLite access and watched queries                                                          |
| Immutable state       | `freezed_annotation`, `freezed`         | Generated immutable states, equality, and `copyWith`                                             |
| Result handling       | `dartz`                                 | Explicit success/failure results with `Either`                                                   |
| Images and loading UI | `cached_network_image`,  `animate_do`   | Handling Image loading and caching                                                               |
| Testing               | `flutter_test`, `bloc_test`, `mocktail` | Widget tests and isolated Bloc/Cubit tests                                                       |

## Architecture

The code is grouping by feature and then split into presentation, domain, and data layers following clean architecture.
- Data: Handles data from remote and local sources including `repository`, `datasource`, and `models`
- Domain: Contains Business rules, entities, repository contract and use cases
- Presentations: Contains UI and state management datafi including `bloc`, `state`, `event`, `widget`

```text
Widget
  │
  ▼
Bloc / Cubit
  │
  ▼
Use case
  │
  ▼
Repository interface (domain)
  │
  ▼
Repository implementation (data)
  │
  ├── Remote data source ── Dio ── TMDB API Server
  │
  └── Local data source ─── Drift ── SQLite
```

## Project structure

```text
lib/
├── core/
│   ├── config/              # Environment access
│   ├── di/                  # GetIt and Injectable configuration
│   ├── error/               # Exceptions and Failure types
│   ├── network/             # API constants and response errors
│   ├── usecase/             # Shared use-case contracts
│   └── utils/               # Enums and small helpers
│
├── features/
│   ├── movies/
│   │   ├── data/
│   │   │   ├── datasource/  # Dio-backed remote source
│   │   │   ├── models/      # JSON models and entity mapping
│   │   │   └── repository/  # MovieRepository implementation
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   ├── repository/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── components/
│   │       ├── controller/  # MoviesBloc and MovieDetailBloc
│   │       └── screens/
│   │
│   └── favorites/
│       ├── data/
│       │   ├── database/    # Drift tables and queries
│       │   ├── datasource/
│       │   ├── models/
│       │   └── repository/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repository/
│       │   └── usecases/
│       └── presentation/
│           ├── controller/  # FavoritesCubit
│           └── screens/
│
└── main.dart

test/
├── favorite_database_test.dart
├── favorites_cubit_test.dart
├── favorites_screen_test.dart
├── movie_detail_bloc_test.dart
├── movie_model_test.dart
└── movies_bloc_test.dart
```

## Getting started

### Requirements

- Flutter SDK
- A TMDB API key

### 1. Add the TMDB API key

Create a `.env` file in the project root:

```dotenv
API_KEY=your_tmdb_api_key
```

### 2. Install dependencies and generate files

```bash
flutter pub get
dart run build_runner build
```

### 3. Run the app

```bash
flutter run
```

## Testing

```bash
flutter test
dart analyze
```

## Next Features

- [ ] Movie search with debouncing and restartable requests
- [ ] Pagination for each movie section
- [ ] More useful retry actions on network errors
- [ ] Sorting or filtering the favorites list
- [ ] Offline caching for movie-list responses

## Data source

Movie sources come from [The Movie Database (TMDB)](https://www.themoviedb.org/). This project uses the TMDB API.
