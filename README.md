# Antripe Task – Flutter Mobile App

A clean, multi-screen Flutter application built for **Gain Solutions Ltd** as part of the Mobile App Developer (Flutter) test task.  
Implements feature-rich UI, state management, and simulated API integration.

# Overview

**Key Features:**

- Riverpod state management
- GoRouter navigation

# Screens & Features

**1. HOme Screen**

- Dynamic test list with status indicators


# Architecture

**Structure:**

lib/
├── core/
├── features/
│ ├── ticket/
│ ├── contacts/
│ ├── profile/
│ ├── splash/
│ └── bottom_nav_bar/
└── gen/

**State Management:**

- `StateNotifierProvider`, `FutureProvider`, `StateProvider`, `Provider`

**Navigation:**

- GoRouter with ShellRoute & BottomNavigationBar
- Named routes + modal filter screen + custom transitions

# UI & Design

- Material Design 3
- Light themes
- Responsive layout (`flutter_screenutil`)
- Reusable custom widgets
- Smooth animations & clean typography

# API Simulation



# Dependencies

- `flutter_riverpod`
- `go_router`
- `flutter_screenutil`
- `flutter_svg`
- `shimmer`
- `flutter_animate`
- `hive_ce`

# Getting Started

**Prerequisites:** Flutter 3.38.7+, Dart 3.10.7+

```bash
flutter pub get
flutter run
flutter build apk --release
dart run build_runner build
```
