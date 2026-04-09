# Word Quiz App

A Flutter-based multiple choice quiz app with categories, difficulty levels, a countdown timer, and score tracking.

---

## Features

- **3 Quiz Categories** — Flutter, Python, General Knowledge
- **3 Difficulty Levels** — Easy (5 questions), Medium (8 questions), Hard (10 questions)
- **15-second countdown timer** per question — auto-advances on timeout
- **High score tracking** per category and difficulty
- **Wrong answer review** — see what you got wrong with the correct answers
- **Share your score** — copies result to clipboard
- **Smooth animations** — fade transitions between questions
- **Glass-morphism UI** — warm gradient design with card effects

---

## Live Demo

Try the app here: [https://quizapp-b3f13.web.app](https://quizapp-b3f13.web.app)

---

## Screenshots

> *(Add screenshots here)*

---

## How to Run

**Requirements:**
- Flutter SDK ^3.11.4
- Dart SDK included with Flutter

**Steps:**

```bash
git clone <your-repo-url>
cd word_quiz_app
flutter pub get
flutter run
```

Supports Android, iOS, Web, Windows, macOS, and Linux.

---

## How to Play

1. Open the app and choose a **category** (Flutter / Python / General)
2. Select a **difficulty level** (Easy / Medium / Hard)
3. Answer each question before the **15-second timer** runs out
4. View your **score and results** at the end
5. Review wrong answers and try again!

---

## Project Structure

```
lib/
└── main.dart       # All screens and logic
```

**Screens:**
- `HomeScreen` — Category selection with best scores
- `DifficultyScreen` — Difficulty selection
- `QuizPage` — Main quiz with timer and answer feedback
- `ResultScreen` — Score, review wrong answers, share result

---

## Tech Stack

- **Flutter** (Dart)
- **Material Design 3**
- No external packages — built with Flutter core only

---

## Developer

**Yuva** — Flutter Developer  
Built as a portfolio project while learning Flutter.
