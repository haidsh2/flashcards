# Flashcards Mobile App

This repository contains a Flutter-based mobile flashcard application inspired by Anki. The goal is to provide an offline-first, cross-platform experience for studying with spaced repetition.

## Features
- Create and manage decks of flashcards
- Review cards using the SM-2 spaced repetition algorithm
- Offline-first data storage using Hive
- Simple and clean UI with light and dark themes

## Local Development
1. Install [Flutter](https://docs.flutter.dev/get-started/install)
2. From the `app` directory run `flutter create .` to generate the
   platform folders (`ios/` and `android/`). This repository keeps
   those folders out of version control to stay lightweight.
3. Run `flutter pub get` inside the `app` directory
4. Launch the app with `flutter run`

## Directory Structure
```
app/               Flutter project source
 ├─ lib/
 │   ├─ models/    Data models
 │   ├─ services/  Database and logic
 │   ├─ screens/   UI screens
 │   └─ widgets/   Reusable widgets
 ├─ test/          Unit tests
sample_decks/      Example CSV decks
```

## Building for iOS/Android
Because the platform folders are generated locally, make sure they
exist before running any build commands. You can regenerate them with
`flutter create .` inside the `app` directory if needed.

- Android: `flutter build apk` from the `app` directory
- iOS: `flutter build ios` from the `app` directory

### CI note
If using a CI service such as Codemagic, set the working directory to
`app` so that the `pubspec.yaml` is detected correctly.

## Future Enhancements
- Cloud sync with Firebase or Supabase
- AI-powered card generation and mnemonics
- Audio and image support for cards
