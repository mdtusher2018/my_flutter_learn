# 🚀 Flutter Template – Clean Architecture & Scalable App Boilerplate

A production-ready **Flutter project template** built with **Clean Architecture**, **SOLID Principles**, and **Feature-Driven Development**. This template is scalable, maintainable, and ideal for medium to large applications.

---

## 🌟 Features & Highlights

### 🏗 Architecture & Code Quality

* Clean Architecture (Data → Domain → Presentation)
* SOLID principles applied across layers
* Feature-driven folder structure
* Centralized API client with interceptor-based session refresh
* Global error handling & crash logging
* Automatic 401 unauthorized logout
* Strict separation of concerns (UI ↔ Logic ↔ Repository ↔ Models)

### 💻 State Management & Routing

| Library                | Usage                                            |
| ---------------------- | ------------------------------------------------ |
| **Riverpod**           | App-wide state management & dependency injection |
| **Riverpod Generator** | Auto-generated providers & notifiers             |
| **GoRouter**           | Typed routing, navigation, redirection           |
| **Global 401 Handler** | Auto logout on unauthorized                      |

---

## 🛠 Tech Stack & Packages

### 🔑 Core Dependencies

| Package                    | Purpose                                 |
| -------------------------- | --------------------------------------- |
| **dio**                    | API calls, interceptors, refresh tokens |
| **flutter_secure_storage** | Secure storage for tokens/sessions      |
| **shared_preferences**     | Lightweight local storage               |
| **logger**                 | Debug-only logging                      |
| **firebase_core**          | Firebase initialization                 |
| **firebase_analytics**     | User behavior analytics                 |
| **firebase_crashlytics**   | Crash reporting                         |
| **rive**                   | High-quality animations                 |
| **protobuf**               | Demonstration of binary serialization   |

### 👨‍💻 Code Generation

* **freezed + annotation** – immutable models & sealed classes
* **json_serializable** – auto JSON mapping
* **riverpod_annotation** – simplified state management
* **build_runner** – code generation engine

#### Benefits

✔ Strongly typed models
✔ Minimal boilerplate
✔ Immutable data
✔ Safer & cleaner architecture

---

## 🧪 Testing

Unit tests included for:

* Services
* ViewModels / Notifiers
* Utility functions

Tools used:

* **mockito**
* **mocktail**
* **flutter_test**
* **test**

> Note: Focused on **Unit Tests** for now.

---

## 🔐 Security & Session Management

* Automated session refresh using Dio interceptors
* Secure token storage via flutter_secure_storage
* Global unauthorized interceptor → auto logout
* Logging enabled only in debug

---

## 🎬 Rive Animations

Integrated Rive animations for:

* Splash screen
* Login animation
* Onboarding views

Example asset included:

```
assets/3469-7899-login-screen-character.riv
```

---

## 📁 Project Structure Overview

```
lib/
 └── src/
     ├── config/
     │   └── router/
     │       ├── app_router.dart
     │       └── routes.dart
     │
     ├── core/
     │   ├── analytics_and_crashlytics/
     │   ├── base/
     │   ├── di/
     │   │   ├── parts/
     │   │   ├── dependency_injection.dart
     │   │   └── dependency_injection.g.dart
     │   ├── services/
     │   │   ├── network/
     │   │   ├── snackbar/
     │   │   ├── storage/
     │   │   └── utils/
     │   └── providers.dart
     │
     ├── features/
     │   ├── authentication/
     │   │   ├── data/
     │   │   │   ├── models/
     │   │   │   └── repositories/
     │   │   ├── domain/
     │   │   │   ├── entities/
     │   │   │   └── repositories/
     │   │   │   
     │   │   ├── usecase/
     │   │   └── presentation/
     │   │       ├── notifiers/
     │   │       └── pages/
     │
     │   ├── profile/
     │
     ├── shared/
     │
     ├── unorganized_files/
     │
     ├── firebase_options.dart
     └── main.dart
```

**Why feature-based?**
✔ Independent development per feature
✔ Highly scalable & maintainable
✔ Better code isolation
✔ Cleaner version control

---

## 🧩 Protobuf Module

Used as a learning & performance demo.

Best used for:

* Large APIs where response size matters
* Low-bandwidth communication
* Faster serialization than JSON

---

## 🚀 Getting Started

### Step 1: Install dependencies

```
flutter pub get
```

### Step 2: Run code generators

```
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 3: Launch the app

```
flutter run
```

---

## 🧰 Build Variants

### Debug Mode

* Logging enabled
* Error trace enabled
* Hot reload supported

### Release Mode

* Logging disabled
* Crashlytics enabled
* Performance optimized

---

## 📦 Full Dependency List

```
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  dio: ^5.9.0
  flutter_secure_storage: ^9.2.4
  shared_preferences: ^2.5.3
  flutter_riverpod: ^2.6.1
  flutter_screenutil: ^5.9.3
  logger: ^2.6.2
  go_router: ^17.0.0
  firebase_core: ^4.2.1
  firebase_analytics: ^12.0.4
  firebase_crashlytics: ^5.0.5
  rive: ^0.13.20
  riverpod_annotation: ^2.3.5
  freezed_annotation: ^3.0.0
  json_annotation:
  protoc_plugin: ^25.0.0


dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  mocktail: ^1.0.4
  freezed:
  build_runner: ^2.5.4
  riverpod_generator:
  json_serializable:
  mockito:
```

---

## ❤️ Contributing

Feel free to open issues or submit PRs! Improvements are always welcome.

---

## ✨ Thank You
Thanks for checking out this template.
Wishing you an awesome Flutter development journey! 🚀
