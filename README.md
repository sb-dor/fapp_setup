# 📱 FApp Setup
### 🚀 Easy & Fast Way to Start Your Flutter Project

**FApp Setup** is a starter Flutter project designed to help you kickstart your app development process with a clean, scalable architecture. This project leverages the Bloc pattern for managing app data, which can be used with any state management solution.

## 🗂️ Project Structure

- **🔗 API**: Handles communication with external services.
- **🧠 Bloc**: The brain of the application, responsible for managing data and state. It uses the `notifyListeners` method to trigger UI updates.

## 🌟 Features

- **🔥 Firebase**: Integrated for backend services like Firestore, Firestorage, Authentication, etc.
- **🌗 Theme**: Light and Dark mode support for enhanced user experience.
- **🌍 Language**: Multi-language support with locale integration for a global audience.
- **🔑 Google Authentication**: Seamless sign-in and authentication with Google accounts.

## 🛠️ Usage

There are two ways to use this project:

### Option 1: Replace Your Existing Project's `lib` Folder

1. **Create a Flutter Project**: Start by creating a new Flutter project in your preferred way.
2. **Replace Your `lib` Folder**: Download this repository and replace the `lib` folder of your Flutter project with the one from this repo.
3. **Update `pubspec.yaml`**: Replace the dependencies in your `pubspec.yaml` with those from this project to ensure all necessary packages are included.
4. **Remove Unused Features**: If you don't need certain features like Firebase, In-App Purchases, or Google Mobile Ads, feel free to remove the corresponding Bloc, services, and dependencies.
5. **Configure Firebase**: If you're using Firebase, make sure to configure it by following the instructions on the [Firebase website](https://firebase.google.com/docs/flutter/setup).

### Option 2: Clone the Repository

1. **Clone the Repository**: Open your terminal and run the following command:
   ```bash
   git clone https://github.com/sb-dor/fapp_setup.git
   ```
2. **Get Dependencies**: Run the following command to get all the required dependencies:
   ```bash
   flutter pub get
   ```
3. **Configure Firebase**: If you're using Firebase, configure it using FlutterFire CLI:
   ```bash
   flutterfire configure
   ```
4. **Update Firebase Options**: Open the file `lib/main.dart` and uncomment the Firebase options line:
   ```dart
   if (defaultTargetPlatform != TargetPlatform.linux) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
   ```
5. **Run the Project**: Finally, run the project using:
   ```bash
   flutter run
   ```

Remember to customize the project according to your needs, removing any unnecessary features or dependencies.

## 🤝 Contribution

Feel free to contribute to this project by opening issues or submitting pull requests. Your contributions are welcome!