# NeuraBot AI - Flutter Chat UI

A premium, high-fidelity AI Chat Application UI built with Flutter, designed to match modern Figma UI kits with pixel-perfect layouts, responsive design patterns, and modular project structure.

---

## 📱 Features

1. **Splash Screen**
   * Premium animated logo presentation.
   * Auto-navigation based on launch state: first-time users see the onboarding screens, while returning users automatically bypass onboarding and land directly on the **Login** screen.

2. **Onboarding Slider**
   * Built with the popular `carousel_slider` package.
   * Features custom page dots indicator, premium purple accent highlights, and clean typography.
   * Responsive layout optimized for tall/notch devices.

3. **Login Screen**
   * Sleek dark-blue form inputs (`AppColors.primary500`).
   * Password visibility toggles, customized checkboxes, and clean navigation flows.
   * Minimalist form design aligned with modern UI aesthetics.

4. **NeuraBot Chat Interface**
   * **Welcome State**: Displays quick action greeting grids (Smart Replies, Mood Mode, Voice Input, Chat History) with distinct colored icons.
   * **Chat State**: Selecting any action or typing a prompt automatically shifts into live bubble conversations.
   * **Typing Indicator**: Smooth loading bubble showing AI thinking state before responding.
   * **Responsive Auto-scroll**: Smoothly slides the window view to the latest messages.

---

## 📂 Project Architecture

The codebase follows clean and modular architecture patterns, separating routing, styles, and reusable custom widgets:

```
lib/
├── constants/
│   ├── colors.dart         # Custom primary/secondary color palettes
│   ├── styles.dart         # Heading and body typography styles
│   └── image_paths.dart    # Onboarding and logo image assets paths
├── pages/
│   ├── splash/
│   │   └── splash_screen.dart
│   ├── onboarding/
│   │   ├── onboarding_screen.dart
│   │   └── widgets/        # Separated onboarding sub-widgets
│   ├── login/
│   │   └── login_screen.dart
│   └── chat/
│       ├── chat_screen.dart
│       └── widgets/        # Separated chat UI sub-widgets
└── router/
    └── app_router.dart     # GoRouter configurations and app paths
```

---

## 🛠️ Tech Stack & Dependencies

* **Core SDK**: Flutter SDK (Dart ^3.9.2)
* **Routing**: [go_router](https://pub.dev/packages/go_router)
* **Slider/Carousels**: [carousel_slider](https://pub.dev/packages/carousel_slider)
* **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences) for tracking application launch state.

---

## 🚀 Getting Started

### Prerequisites

Ensure you have Flutter SDK installed on your system. Run diagnostics with:
```bash
flutter doctor
```

### Installation

1. Clone or pull the repository:
   ```bash
   git clone https://github.com/AIVIETNAM-AIO-VanTuyen/neura-bot.git
   ```
2. Navigate to the project folder and download the packages:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```
