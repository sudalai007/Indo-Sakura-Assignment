# Pranic Healing Sanctuary - IIS Mobile Application

A production-ready Flutter application built for **Indo Sakura Software Pvt Ltd**, replicating the Master Choa Kok Sui Spiritual Meditation & Healing Figma design with strict adherence to **Feature-First Clean Architecture**, **Riverpod State Management**, **GoRouter Navigation**, and **Firebase Authentication**.

---

## 📱 App Highlights & Figma Implementation

- **Splash & First-Launch Decision Flow**: Ambient breathing animation, checking local cache for onboarding status and auth session.
- **Onboarding Experience**: Multi-step interactive carousel highlighting Twin Hearts Meditation, 432 Hz frequencies, and Daily Sadhana tracking, persisted locally via `SharedPreferences`.
- **Firebase Authentication**: Clean login & registration flows with form validation, error handling, password visibility toggling, and fallback simulation for offline evaluation.
- **Home / Sanctuary Screen**:
  - Top Live Stream indicator & greeting ("Harmonize the Throat & Crown Chakras today").
  - Search bar for mantras, Twin Hearts, and affirmations.
  - **Daily Arhatic Wisdom** card with Sutra 108 and deep contemplation action.
  - **Featured Album** card: *Mantra OM: The Sound of Stillness (108 Repetitions • 432 Hz)*.
  - **Popular Meditations** horizontal carousel with dynamic sacred gradients.
- **My Albums Screen**:
  - Filter chips (*All Albums*, *Downloaded*, *Favorites*, *Chants*).
  - High-fidelity **"Your Sanctuary is Empty"** state with concentric aura rings and lotus flower emblem.
  - **Recommended for Your Practice** cards (*Meditation on Twin Hearts*, *Meditation on the Soul*).
- **Playlists Screen**:
  - Filter tabs (*Recent*, *Created*, *Most Played*, *Sacred OM*).
  - **Create Sacred Playlist** pastel gradient action banner.
  - Sacred playlist tiles with badge tags (*TH-01*, *AURA*, *YOGA*), durations, and play controls.
- **My Profile Screen**:
  - Profile header with user avatar, name (*Samyuktha J*), badge (*ARHATIC PRACTITIONER • LEVEL 1*), and country.
  - 3-column stats cards: **128 Hours Meditated**, **45 Day Streak**, **24 Sacred Tracks**.
  - Interactive tabs (*Recently Played*, *Favorites*, *Downloads*).
  - Recent meditation sessions with timestamp history.
  - Spiritual quote banner from Master Choa Kok Sui.
- **Settings & Practice Screen**:
  - Detailed drill-down for *Practice & Audio*, *Account & Preferences*, and *Pranic Healing Trust & Info*.
  - Delete Account & Logout actions.
- **Persistent Mini-Player**:
  - Floating dark indigo player dock above bottom navigation (*Meditation on Twin Hearts • 14:20 left*), equipped with like, play/pause, and next controls.

---

## 🏛️ Architecture & Folder Structure

This project follows **Feature-First Clean Architecture**, ensuring high scalability, testability, and separation of concerns:

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart        # Sacred purple, lavender, pink, and dark gradients
│   │   └── app_styles.dart        # Typography and text styles
│   ├── router/
│   │   └── app_router.dart        # GoRouter singleton with ShellRoute
│   ├── services/
│   │   └── local_storage_service.dart # SharedPreferences wrapper
│   └── widgets/
│       ├── main_nav_scaffold.dart # Persistent bottom nav shell
│       └── mini_player_widget.dart# Floating audio player dock
│
├── features/
│   ├── auth/
│   │   ├── data/                  # Firebase Auth repository & User model
│   │   ├── domain/                # Auth contracts & User entity
│   │   └── presentation/          # Login & Register screens + AuthController
│   │
│   ├── onboarding/
│   │   ├── data/                  # SharedPreferences onboarding datasource
│   │   ├── domain/                # Onboarding repository
│   │   └── presentation/          # Splash & Onboarding carousel screens
│   │
│   ├── home/
│   │   ├── data/                  # Local static JSON data source & models
│   │   ├── domain/                # Wisdom, Album & Meditation entities
│   │   └── presentation/          # Home screen, Wisdom card, Featured album, Carousel
│   │
│   ├── albums/
│   │   ├── data/ & domain/        # Recommended practice models & entities
│   │   └── presentation/          # My Albums screen & empty sanctuary state
│   │
│   ├── playlists/
│   │   ├── data/ & domain/        # Playlist models & entities
│   │   └── presentation/          # Playlists screen & playlist items
│   │
│   └── profile/
│       ├── data/ & domain/        # User profile & session history
│       └── presentation/          # Profile screen, stats cards & Settings screen
│
└── main.dart                      # App entry point with ProviderScope & Firebase init
```

---

## 📦 Packages Used & Rationale

| Package | Purpose & Justification |
|---|---|
| `flutter_riverpod` | Industry-standard reactive state management providing testable, decoupled, and compile-safe providers. |
| `go_router` | Declarative routing with deep linking, stateful navigation shell (indexed stack) for persistent bottom navigation, and centralized route management. |
| `firebase_core` & `firebase_auth` | Core Firebase initialization and authentication flow for user sign-in and registration. |
| `shared_preferences` | Local persistent storage for caching onboarding completion status and session hints. |
| `cupertino_icons` | Supplementary iOS-style glyphs and visual markers. |

---

## 🚀 Getting Started

### 1. Prerequisites
- Flutter SDK 3.19+ (Channel stable)
- Dart 3.0+
- Android Studio / VS Code with Flutter extension

### 2. Setup Instructions
```bash
# Clone the repository
git clone <your-repo-link>
cd indo_sakura_assignment

# Install dependencies
flutter pub get

# Run analyzer to check code health
flutter analyze

# Run tests
flutter test

# Run application
flutter run
```

### 3. Firebase Setup
If connecting to a live Firebase project:
1. Run `flutterfire configure` to generate `firebase_options.dart`.
2. Add `google-services.json` to `android/app/`.
3. Add `GoogleService-Info.plist` to `ios/Runner/`.
*(Note: If live credentials are not present, the app gracefully falls back to simulated authentication so reviewers can immediately evaluate all UI screens without setup friction.)*

---

## 🧪 Testing
Unit and widget tests can be run via:
```bash
flutter test
```
