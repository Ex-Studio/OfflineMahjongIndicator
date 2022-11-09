# OfflineMahjongIndicator

A Flutter app for mobile.

## Usage

1. Long press `Chrome` icon on your phone desktop and click `App info`. In `Permissions > Settings`, enable `Home screen shortcuts`.
1. Open <https://ex-studio.github.io/OfflineMahjongIndicator/#/> in `Chrome`.
1. Open menu button from the top right corner and click `Install app`.
1. Wait a moment and you can open the app from your desktop.

## Development

```
flutter run -d mac --no-sound-null-safety
```

```
flutter run -d chrome --web-renderer html --no-sound-null-safety
```

## Deployment

```
flutter build web --web-renderer html --no-sound-null-safety
```
