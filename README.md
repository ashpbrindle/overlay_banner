## Usage

```dart
OverlayNotifier notifier = OverlayNotifier();
```

```dart
MaterialApp(
      BannerWrapper(
            overlayNotifier: notifier,
            child: Scaffold(
              appBar: AppBar(
                title: Text("My App"),
              ),
              body: Center(),
           ),
        ),
     );
```

```dart
notifier.showBanner(banner, autoDismiss: true);
notifier.hideBanner();
```

## Features

|Usage|Image|
|-----|-----|
|`overlayNotifier.showBanner(banner, autoDismiss: true);`|<img src="https://user-images.githubusercontent.com/59151951/221324458-00720eac-f583-420e-a0f4-5249369bd1e2.gif" width="250">|
|`OverlayBanner.warning();`|<img src="https://user-images.githubusercontent.com/59151951/221324507-7ace185c-1dbc-4473-9c1d-fbaba3bdd0cf.gif" width="250">|
|`OverlayBanner.success();`|<img src="https://user-images.githubusercontent.com/59151951/221324538-ce3cf28e-dd4f-4f4b-87d0-375317b54e58.gif" width="250">|
|`OverlayBanner.update();`|<img src="https://user-images.githubusercontent.com/59151951/221324551-10a59960-607e-4da0-be3e-4ec828408191.gif" width="250">|
