# OfflineMahjongIndicator

A mobile app made by [Flutter](https://flutter.dev) to indicate seats in an offline Mahjong game.

## Installation

### Web (portrait and landscape)

1. In the control center, disable `Lock orientation`.
2. Open <https://ex-studio.github.io/OfflineMahjongIndicator/#/> and choose whether portrait or landscape.

### Chrome (portrait)

1. Long press `Chrome` icon on your phone desktop and click `App info`. In `Permissions > Settings`, enable `Home screen shortcuts`.
2. Open <https://ex-studio.github.io/OfflineMahjongIndicator/#/> in `Chrome`.
3. Open menu button from the top right corner and click `Install app`.
4. Wait until the app is added to the desktop.

### Android (landscape)

1. Download the latest apk from <https://github.com/Ex-Studio/OfflineMahjongIndicator/releases>.
2. Install it on your phone.

## Development

```
flutter run -d mac
```

```
flutter run -d chrome --web-renderer html
```

## Deployment

```
flutter build web --web-renderer html
```

```
flutter build apk
```
