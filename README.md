# bjj_manager

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Dependencies

```sh
flutter pub add go_router
flutter pub add provider
flutter pub add logging
flutter pub add http
flutter pub upgrade --major-versions
```

```yaml
window_size:
    git:
      url: https://github.com/google/flutter-desktop-embedding.git
      path: plugins/window_size
```

## Network

### MacOS

Add

```xml
<key>com.apple.security.network.client</key>
<true/>
```

to macos/Runner/Release.entitlements and macos/Runner/DebugProfile.entitlements.

### Android

Add

```xml
<manifest xmlns:android...>
 ...
 <uses-permission android:name="android.permission.INTERNET" />
 <application ...
</manifest>
```

to android/app/src/main/AndroidManifest.xml.
