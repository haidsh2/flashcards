# Flashcards Mobile App

This repository contains a Flutter-based mobile flashcard application inspired by Anki. The goal is to provide an offline-first, cross-platform experience for studying with spaced repetition.

## Features
- Create and manage decks of flashcards
- Review cards using the SM-2 spaced repetition algorithm
- Offline-first data storage using Hive
- Simple and clean UI with light and dark themes

## Local Development
1. Install [Flutter](https://docs.flutter.dev/get-started/install)
2. Run `flutter pub get` inside the `app` directory
3. Launch the app with `flutter run`

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
- Android: `flutter build apk`
- iOS: `flutter build ios`

## Future Enhancements
- Cloud sync with Firebase or Supabase
- AI-powered card generation and mnemonics
- Audio and image support for cards
