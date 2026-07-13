# Tharad App (TharadTech) 📱

A professional Flutter mobile application built as part of the **Flutter Developer Training Role** assessment. This project demonstrates clean architecture, reactive state management using BLoC, secure offline caching, localized multi-language support, and optimized responsive layouts.

---

## 🚀 Architecture & Folder Structure

The project follows a **Feature-First Clean Architecture** which isolates core reusable layers from feature-specific presentations and business logic.

```
lib/
├── core/                  # Core modules shared across all features
│   ├── api/               # API service class for networking
│   ├── caching/           # Encrypted local storage (Hive + Secure Storage)
│   ├── constants/         # Global constant strings and values
│   ├── helpers/           # Helper classes (e.g. form validators)
│   ├── logic/             # Core Cubits (e.g. localization logic)
│   ├── network/           # Dio configuration and Interceptors
│   ├── routing/           # Custom on-demand route generation
│   ├── theming/           # App-wide color palettes and gradients
│   └── widgets/           # Global reusable UI components
├── features/              # Feature-based folders
│   ├── auth/              # Authentication Feature
│   │   ├── data/          # Auth repositories and models
│   │   ├── logic/         # Auth state management (AuthCubit)
│   │   └── ui/            # Screens (Login, SignUp, OTP Verification)
│   ├── home/              # Home Dashboard Feature
│   │   └── ui/            # Home Layout & Specific Sub-widgets
│   └── profile/           # Profile & Setting Feature
│       ├── data/          # Profile repositories
│       ├── logic/         # Profile state management (ProfileCubit)
│       └── ui/            # Profile Screen, Forms, Headers
├── generated/             # Auto-generated localization code (flutter_intl)
├── l10n/                  # Localization files (AR/EN)
├── main.dart              # Application entry point
└── tharad_tech.dart       # Main MaterialApp wrapper & configuration
```

---

## 🛠️ File Purpose & Codebase Highlights

### 📁 Core Configurations

*   **[`lib/main.dart`](./lib/main.dart)**: Initializes the Flutter widgets binding, starts the secure caching system (`CacheService.init()`), and boots the application.
*   **[`lib/tharad_tech.dart`](./lib/tharad_tech.dart)**: The root widget of the application. Integrates `ScreenUtilInit` for design responsiveness, provides global Cubits (`LanguageCubit`), maps routes, and handles auto-login routing (loads `ProfileScreen` if active session is detected, otherwise `LoginScreen`).
*   **[`lib/core/api/api_service.dart`](./lib/core/api/api_service.dart)**: Contains all explicit API endpoint wrappers (`login`, `register`, `logout`, `verifyOtp`, `getProfileDetails`, `updateProfile`) using Dio.
*   **[`lib/core/caching/cache_service.dart`](./lib/core/caching/cache_service.dart)**: Implements encrypted local caching via `Hive`. An AES encryption key is dynamically generated and persisted in the device's hardware-backed `FlutterSecureStorage` key store to encrypt credentials, tokens, and offline sessions.
*   **[`lib/core/network/dio_client.dart`](./lib/core/network/dio_client.dart)**: Sets up the HTTP network client using Dio, configuring base URLs, connection/receive timeouts, automatic Bearer Authorization injection headers, and API logging.
*   **[`lib/core/routing/routes.dart` & `lib/core/routing/app_router.dart`](./lib/core/routing/)**: Declares route constant names and maps routes to material page routes dynamically.
*   **[`lib/core/helpers/validators.dart`](./lib/core/helpers/validators.dart)**: Custom form validation utility (Email format, Password length, passwords match, empty fields).
*   **[`lib/core/theming/colors.dart`](./lib/core/theming/colors.dart)**: Holds custom visual themes, UI color constants, and Linear Gradients matching the design guidelines.

### 📁 Features Implementation

*   **Auth Module (`features/auth`)**:
    *   `login_screen.dart`: Login interface with inputs, "Remember Me" toggle, and options to redirect to Sign Up.
    *   `singup_screen.dart`: Form for registration allowing username, email, password, and custom avatar upload (using `ImagePicker`).
    *   `otp.dart`: Form for OTP confirmation input after registration.
    *   `auth_cubit.dart` / `auth_state.dart`: Manages login/registration asynchronously, saving session tokens locally upon success.
*   **Home Module (`features/home`)**:
    *   `home_screen.dart`: Home dashboard showing user layout.
    *   `home_banner.dart`, `about_training_section.dart`, `work_nature_section.dart`: Components displaying specific dashboard cards and educational materials.
*   **Profile Module (`features/profile`)**:
    *   `profile_screen.dart`: Main dashboard profile management view containing update forms and user info.
    *   `profile_form.dart` & `profile_header.dart`: Forms/headers displaying cached values, letting users edit fields, upload a new profile picture, or log out.
    *   `profile_cubit.dart`: Controls state updates, supports offline fallback (loads cached details if network requests fail offline), and clears storage on logout.

---

## 📚 Libraries & Dependencies Used

This application uses the following libraries to enforce reliability, performance, and best practices:

| Package | Version | Purpose |
| :--- | :--- | :--- |
| **`flutter_bloc`** | `^9.1.1` | State management pattern for separating UI from business logic. |
| **`dio`** | `^5.9.2` | Robust HTTP client for handling network requests, file uploads, and interceptors. |
| **`hive_flutter`** | `^1.1.0` | Lightweight and blazing-fast key-value database built for Flutter apps. |
| **`flutter_secure_storage`**| `^9.2.2` | Secure key/value database wrapper for storing sensitive encryption keys. |
| **`image_picker`** | `^1.2.2` | Enables user photo selection from camera or gallery. |
| **`flutter_screenutil`** | `^5.9.3` | Responsive layout design utility for adapting UI size to any screen model. |
| **`google_fonts`** | `^6.1.0` | Simplifies loading custom modern Google Fonts dynamically. |
| **`flutter_svg`** | `^2.3.0` | Renders Vector SVG icons/drawings smoothly. |
| **`intl` / `intl_utils`** | `^0.20.2` | Provides internationalization/localization features (English and Arabic). |

---

## ⚙️ Getting Started & Setup

### Prerequisites

*   Flutter SDK: `^3.12.0`
*   Dart SDK: `^3.12.0`
*   Cocoapods (for iOS deployments)

### Installation Steps

1.  **Clone the Repository**:
    ```bash
    git clone <repository_url>
    cd testing_app
    ```

2.  **Get Dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Generate Localization (Intl)**:
    ```bash
    flutter pub run intl_utils:generate
    ```

4.  **Run Code Generator (if build_runner is present)**:
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

5.  **Run the Application**:
    *   For development debug mode:
    ```bash
    flutter run
    ```
