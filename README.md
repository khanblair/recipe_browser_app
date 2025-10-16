A concise Flutter app that browses recipes from TheMealDB with search, filter, details, and favorites.

## Setup

1) Flutter 3.27.x and Dart 3.6+ installed.
2) Get packages and run:

```powershell
flutter pub get
flutter run --dart-define=GEMINI_API_KEY=YOUR_KEY
```

> GEMINI_API_KEY is optional; if omitted, AI suggestions are disabled.

## Architecture

- State: Riverpod
- Networking: Dio
- Routing: go_router
- Models: Freezed + json_serializable
- Cache: Hive (favorites, small local cache)

## Notes

- TheMealDB lacks server pagination; the app uses client-side chunking.
- Offline shows cached categories and last successful list when available.

## Development

Run codegen when changing models:

```powershell
dart run build_runner build -d
```

Analyze and test:

```powershell
flutter analyze
flutter test
```

## Routes

- / — Recipe list (search + filter + pagination)
- /detail/:id — Recipe detail
- /favorites — Favorites list

## Time log (fill on completion)

- Planning & setup: ~
- Data layer & models: ~
- List/search/filter: ~
- Details & polish: ~
- Favorites & offline: ~
- README & tests: ~


A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
