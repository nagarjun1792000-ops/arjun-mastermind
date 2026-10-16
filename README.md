# Arjun Mastermind

A Tamil-first Flutter all-in-one super app with nine feature areas:

1. விளையாட்டுகள் — Games
2. உணவு ஆர்டர் — Food Order
3. உடை ஆர்டர் — Dress Order
4. வேலைவாய்ப்புகள் — Jobs
5. திரைப்படங்கள் — Movies
6. பயண டிக்கெட் — Travel Ticket
7. புத்தகங்கள் — Books Download
8. உலகச் செய்திகள் — World News Live
9. மொபைல் ரீசார்ஜ் — Mobile Recharge

## Run locally

Install Flutter 3.19 or newer, then run:

```bash
flutter pub get
flutter run
```

This repository contains the app source and Flutter package configuration. If
the native platform folders have not been generated in your checkout yet, run
this once before `flutter run`:

```bash
flutter create . --platforms=android
```

## Build an Android APK

Make sure Android Studio and an Android SDK are installed, then run:

```bash
flutter build apk --release
```

The release APK will be generated at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## GitHub Actions

The workflow at `.github/workflows/build-apk.yml` builds the release APK on
pushes to `main` or `master`, pull requests, and manual workflow runs. The APK
is uploaded to the workflow run as the
`namma-ooru-app-release-apk` artifact.

The UI is intentionally dependency-free. The feature pages currently provide a polished, navigable foundation with sample content and interaction states; live ordering, payments, ticketing, and news APIs can be connected later without changing the home navigation structure.
