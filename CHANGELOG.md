# Changelog

All notable changes to this project will be documented in this file.

The format is based on Keep a Changelog and this project adheres to Semantic Versioning.

## Development Plan (used to guide this work)

Before writing code, I outlined this plan to ensure a focused, high‑quality implementation:

1. Scope and success criteria
   - Deliver a professional recipe browser using TheMealDB with search, category filter, details, and favorites.
   - Emphasize code quality, UI/UX, error handling, and clear documentation.

2. Architecture decisions
   - State: Riverpod; Networking: Dio; Routing: go_router; Models: Freezed/JSON; Persistence: Hive.
   - Feature‑first structure; clean layering: UI → Providers → Repository → API.

3. Project setup
   - Initialize Flutter project and Git repo.
   - Add dependencies; scaffold folders; create API client and constants.

4. Data models and repository
   - Define Freezed models (Category, MealSummary, MealDetail) and JSON serialization.
   - Implement repository methods: categories, filter, search, detail, and an "All" mixed feed.

5. UI features
   - List screen with search (debounced), category chips, client‑side pagination, and cards.
   - Detail screen with hero image, ingredients parsing, instructions, and YouTube link.
   - Favorites with Hive (toggle, list/grid, remove/clear all).

6. UX polish and platform config
   - Material 3 themes, dark mode toggle, error/empty states.
   - Android/iOS app names; Internet permission/ATS.

7. Validation and docs
   - Run analyze/tests; verify flows on device/emulator.
   - Write README and this changelog; capture time log.

## [1.0.0] - 2025-10-17

### Added
- Recipe list with debounced search, category filters (incl. All), and client‑side pagination.
- Recipe details with hero image, ingredients parsing, instructions, and YouTube link.
- Favorites with Hive persistence: toggle, grid UI, swipe‑to‑delete, clear all.
- Dark mode toggle (Light/Dark/System) in navigation drawer.
- Error and empty states with retry.
- Android/iOS configuration: app name "Recipe Browser", Internet permission (Android), ATS (iOS).
- Documentation: README with setup, run, architecture, API, troubleshooting.

### Changed
- UI polish: professional Material 3 components, hero animations, typography and spacing.
- Repository enhancements: mixed "All" feed combining multiple categories for variety.

### Fixed
- Infinite scroll behavior adjusted to avoid rapid multi‑trigger loads and to respect scroll extent.

### Time Spent (total 4h)
- Planning & setup: 25 min — Clarified requirements; selected stack; scaffolded project.
- Data layer & models: 45 min — Dio client, API paths, errors; Freezed models; repository + parsing.
- List/search/filter + pagination: 60 min — Debounced search; category chips; pagination; cards.
- Details screen: 35 min — SliverAppBar hero; ingredients parsing; instructions; YouTube link.
- Favorites: 30 min — Hive init; toggle/check; grid UI; swipe‑to‑delete; clear all.
- UI polish & states: 15 min — Dark mode toggle; error/empty states; styling tweaks.
- Platform config: 10 min — App names; Android Internet; iOS ATS.
- Documentation: 20 min — README and changelog authored.

---

Links: Not applicable (initial release)