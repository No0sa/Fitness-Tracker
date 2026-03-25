# Fitness Tracker

A premium, feature-rich Flutter application designed to help you track your daily physical activities and monitor your fitness progress with an elegant and intuitive user interface.

## 🚀 Features

- **Personalized Dashboard**: Get a quick overview of your daily steps, burned calories, total distance, and workout count.
- **Activity Tracking**: Effortlessly log various types of workouts including Running, Cycling, Yoga, and Gym sessions.
- **Visual Progress**: Monitor your weekly progress with dynamic progress bars and statistical breakdowns.
- **Comprehensive History**: Keep a detailed record of all your past activities with the ability to review and manage them.
- **Premium Design**: Enjoy a modern aesthetic with smooth gradients, micro-animations, and a responsive layout.
- **Local Persistence**: Your data is securely stored on your device using an SQLite database.

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/)
- **Language**: [Dart](https://dart.dev/)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Local Database**: [SQFlite](https://pub.dev/packages/sqflite)
- **Animations**: Flutter Widget Animations & Tweens

## 📦 Prerequisites

Before you begin, ensure you have the following installed:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-started/sdk_setup)
- An IDE (VS Code, Android Studio, or IntelliJ)


## 🏗️ Project Structure

```text
lib/
├── data/
│   ├── database/    # Database helper and initialization
│   ├── models/      # Data models (Activity, etc.)
│   └── repositories/ # Data access layer
├── logic/
│   └── providers/   # State management with Provider
└── presentation/
    └── screens/     # UI Pages (Dashboard, History, etc.)
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Built with ❤️ using Flutter.
