# Peblo Story Buddy

A kid-friendly Flutter application built as part of the Peblo Internship Assignment. The app combines storytelling, text-to-speech narration, and a data-driven quiz experience designed for children using mid-range Android devices.

## Demo Video

Screen Recording:

https://drive.google.com/file/d/12OzTOsxW3t6n7l-WvKqWQPf0xhcj1NjR/view?usp=drivesdk

## GitHub Repository

https://github.com/Himan-stack/peblo-story-buddy

---

## Framework Choice

### Why Flutter?

I chose Flutter because it provides:

* Fast cross-platform development
* Smooth UI animations
* Excellent Android support
* Efficient rendering on mid-range devices
* Easy integration with native Text-to-Speech engines

Since Peblo's target audience includes children using Android devices with limited hardware resources, Flutter was a practical choice for delivering a lightweight and responsive experience.

---

## Features

### AI Buddy Character

* Friendly robot buddy illustration
* Child-friendly visual design
* Serves as a guide throughout the experience

### Story Narration

* Uses the `flutter_tts` package
* Narrates the provided story using the device's native Text-to-Speech engine

### Loading State

* Displays a loading indicator while preparing narration
* Prevents duplicate button taps during initialization

### Error Handling

* Gracefully handles narration failures
* Shows a user-friendly retry message instead of crashing

### Interactive Quiz

* Automatically appears after narration
* Generated from JSON data
* Supports dynamic option counts without UI code changes

### Wrong Answer Feedback

* Shake animation
* Retry opportunity
* Child-friendly learning experience

### Success State

* Confetti celebration
* Score display
* Play Again functionality

---

## Project Structure

```text
lib/
├── constants/
│   └── app_constants.dart
│
├── providers/
│   └── story_provider.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── quiz_screen.dart
│   └── result_screen.dart
│
├── services/
│   └── tts_service.dart
│
├── widgets/
│   ├── ai_buddy.dart
│   └── story_card.dart
│
└── main.dart
```

---

## State Management

Provider was used for application state management.

### Implemented Provider

```dart
class StoryProvider extends ChangeNotifier
```

Responsibilities:

* Story loading state
* UI updates
* Notification of state changes using `notifyListeners()`

Provider was selected because:

* Lightweight
* Easy to maintain
* Recommended for small to medium Flutter applications

---

## Audio → Quiz Transition

Flow:

1. Child taps "Read Me A Story"
2. Loading state appears
3. Story narration starts
4. Narration completes
5. Quiz screen is displayed
6. Child answers the question
7. Success or retry feedback is shown

This creates a smooth storytelling-to-learning experience.

---

## Data-Driven Quiz Architecture

The quiz is rendered from a JSON-like data structure rather than hardcoded UI.

Example:

```json
{
  "question": "What colour was Pip's lost gear?",
  "options": ["Red", "Blue", "Green", "Yellow"],
  "answer": "Blue"
}
```

The UI dynamically renders:

* Question text
* Any number of options
* Correct answer validation

Because the UI is data-driven, future questions with 3, 4, or 5 options can be displayed without modifying the screen implementation.

---

## Caching Strategy

Current Version:

* Uses local story text
* Uses native device TTS

Future Enhancement:

If narration were generated from a remote service such as ElevenLabs:

* Audio files would be downloaded once
* Cached locally using device storage
* Reused on future launches to reduce network usage and loading time

---

## Audio Loading & Failure Handling

Implemented:

* Loading indicator during preparation
* Disabled button during loading
* Try-catch error handling
* Friendly retry message using SnackBar

This prevents crashes and improves user experience.

---

## Performance Optimization

Target Device:

* Mid-range Android devices (~3GB RAM)

Optimizations:

* Lightweight widget tree
* Minimal rebuilds
* Provider-based state updates
* Local assets
* Native TTS engine
* Efficient animations
* No heavy network requests

### Performance Validation

Tested on a physical Android device.

Observed:

* Smooth navigation
* Responsive interactions
* Stable TTS playback
* Smooth confetti animation
* No noticeable frame drops

---

## Packages Used

```yaml
provider
flutter_tts
confetti
flutter_animate
```

### Purpose

| Package         | Purpose             |
| --------------- | ------------------- |
| provider        | State management    |
| flutter_tts     | Text-to-Speech      |
| confetti        | Success celebration |
| flutter_animate | UI animations       |

---

## AI Usage & Judgment

AI tools used:

* ChatGPT
* Claude

Areas where AI assistance was used:

* Debugging Flutter build issues
* State management guidance
* Code refactoring suggestions
* Error troubleshooting
* README drafting support

### Suggestion Modified

One suggestion was to hardcode quiz rendering for the provided question.

This approach was rejected because the assignment explicitly required a data-driven quiz engine.

Instead, the quiz was redesigned to render from JSON data so future questions can be displayed without UI changes.

### Challenge Faced

Challenge:

* Asset loading issues
* Flutter package dependency issues
* TTS integration setup
* Navigation and state handling

Resolution:

* Verified asset paths
* Fixed pubspec.yaml configuration
* Properly configured flutter_tts
* Introduced Provider-based state management

---

## How to Run

```bash
git clone https://github.com/Himan-stack/peblo-story-buddy.git

cd peblo-story-buddy

flutter pub get

flutter run
```

---

## Assignment Requirements Checklist

* [x] Kid-friendly UI
* [x] AI Buddy
* [x] Story Card
* [x] Text-to-Speech Narration
* [x] Loading State
* [x] Error Handling
* [x] Data-Driven Quiz
* [x] Dynamic Option Rendering
* [x] Wrong Answer Feedback
* [x] Success State
* [x] Confetti Animation
* [x] Provider State Management
* [x] GitHub Repository
* [x] Screen Recording

---

Built with Flutter for the Peblo Internship Assignment.
