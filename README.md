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
* UseCase

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

* Login views animation

Example asset included:

```
assets/3469-7899-login-screen-character.riv
```

---

## 📁 Project Structure Overview

```
lib/
├── src/
│   ├── config/                      # App-level configs (routes, env, app setup)
│   │   └── router/                  # Navigation & GoRouter setup
│   │       ├── app_router.dart
│   │       └── routes.dart
│   │
│   ├── core/                        # Core utilities, services & foundational layers
│   │   ├── analytics_and_crashlytics/ # Firebase analytics + crash logging
│   │   ├── base/                    # Base classes (BaseNotifier, BaseService, etc.)
│   │   ├── di/                      # Dependency injection setup
│   │   │   ├── parts/               # DI modules grouped by feature
│   │   │   └── dependency_injection.dart
│   │   │
│   │   ├── services/                # App-wide reusable services
│   │   │   ├── network/             # Dio client, interceptors, API setup
│   │   │   ├── snackbar/            # Global snackbar service
│   │   │   ├── storage/             # Secure/local storage handlers
│   │   └── utils/                   # Utility functions & helpers
│   │   └── providers.dart           # Global Riverpod providers
│   │
│   ├── features/                    # Feature-driven modules
│   │   ├── authentication/          # Auth module
│   │   │   ├── data/                # API models + repositories
│   │   │   │   ├── models/          # Freezed models
│   │   │   │   └── repositories/    # Data repository implementations
│   │   │   ├── domain/              # Business logic contracts
│   │   │   │   ├── entities/        # Domain-layer entity models
│   │   │   │   └── repositories/    # Abstract repository interfaces
│   │   │   ├── usecase/             # Authentication usecases
│   │   │   └── presentation/        # UI + state management
│   │   │       ├── notifiers/       # Riverpod Notifiers
│   │   │       └── pages/           # Screens & widgets
│   │   └── profile/                 # Profile feature module
│   │
│   └── shared/                      # Reusable UI widgets, extensions, mixins
│
├── unorganized_files/               # Temporary storage for unstructured files
├── firebase_options.dart            # Firebase initialization config
└── main.dart                        # App entry point
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
  cupertino_icons: 
  dio: 
  flutter_secure_storage: 
  shared_preferences: 
  flutter_riverpod: 
  flutter_screenutil: 
  logger: 
  go_router: 
  firebase_core: 
  firebase_analytics: 
  firebase_crashlytics: 
  rive: 
  riverpod_annotation: 
  freezed_annotation: 
  json_annotation:
  protoc_plugin: 


dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: 
  mocktail:
  freezed:
  build_runner: 
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

