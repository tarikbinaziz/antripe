# Task – Flutter Mobile App

A clean, multi-screen Flutter application built for **Antripe** as part of the Mobile App Developer (Flutter) test task.  
Implements feature-rich UI, state management, and simulated API integration.

## Overview

**Key Features:**

- Riverpod state management for reactive state updates
- GoRouter navigation with named routes, modal filters, and custom transitions
- Responsive layouts using `flutter_screenutil`
- Material Design 3 compliant UI
- Smooth animations & reusable custom widgets
- Local storage with Hive for offline support

## Screens & Features

### 1. Contact Screen

- Dynamic contact list by providing api

### 2. Other Screens

- Splash Screen
- welcome Screen

**State Management:**

- `StateNotifierProvider`
- `Provider`

**Navigation:**

- GoRouter for smoth transaction
- Named routes and modal filter screens
- Custom route transitions

## UI & Design

- Material Design 3
- Light theme (can extend to dark mode)
- Responsive layouts (`flutter_screenutil`)
- Smooth animations using `flutter_animate`
- Reusable components & clean typography

## API Simulation

- Uses `dio` & `pretty_dio_logger` for HTTP request simulation
- Placeholder/mock endpoints for testing dynamic data

---

## Dependencies

- `flutter_riverpod` – State management
- `go_router` – Routing & navigation
- `flutter_screenutil` – Responsive layouts
- `flutter_svg` – SVG image rendering
- `shimmer` – Loading placeholders
- `flutter_animate` – Animations
- `hive_ce` & `hive_ce_flutter` – Local storage
- `flutter_form_builder` & `form_builder_validators` – Forms & validation
- `cached_network_image` – Efficient image caching
- `dio` & `pretty_dio_logger` – Networking
- `country_code_picker` – Country selection

## Setup & Running

**Prerequisites:** Flutter 3.38.7+, Dart 3.10.7

**Steps:**

```bash
# Install dependencies
flutter pub get

# Run the app on a device/emulator
flutter run

# Build APK for release
flutter build apk --release

# Generate Hive & FlutterGen code
dart run build_runner build
Assumptions

API integration is simulated; actual backend endpoints are not yet available.

Only light theme is implemented.

User authentication and error handling are mocked for demo purposes.

Flutter Version
Flutter 3.38.7 • channel stable • Dart 3.10.7
Libraries & Reasoning
Library	Purpose
flutter_riverpod	Robust state management
go_router	Declarative and nested navigation
flutter_screenutil	Responsive UI for multiple screen sizes
flutter_svg	Render vector assets efficiently
shimmer	UI placeholder loading effect
flutter_animate	Smooth animations and transitions
hive_ce	Local lightweight storage
dio	API calls & networking
pretty_dio_logger	Logging HTTP requests
flutter_form_builder	Forms & validation
cached_network_image	Efficient image caching
```
