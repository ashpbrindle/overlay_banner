import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlay_banner/overlay_banner.dart';

void main() {
  group('OverlayNotifier test', () {
    test("showBanner saves the OverlayBanner", () {
      var overlayBanner = OverlayBanner(body: Text("TESTING"));
      var overlayNotifier = OverlayNotifier();
      expect(overlayNotifier.banner, isNull);
      overlayNotifier.showBanner(banner: overlayBanner);
      expect(overlayNotifier.banner, isNotNull);
    });

    test("showBanner updates the OverlayBanner", () {
      var overlayBanner = const OverlayBanner(
        body: Text("TESTING"),
        backgroundColour: Colors.red,
      );
      var overlayBanner2 = const OverlayBanner(
        body: Text("TESTING"),
        backgroundColour: Colors.green,
      );
      var overlayNotifier = OverlayNotifier();
      overlayNotifier.showBanner(banner: overlayBanner);
      expect(overlayNotifier.banner, isNotNull);
      expect(overlayNotifier.banner!.backgroundColour, Colors.red);
      overlayNotifier.showBanner(banner: overlayBanner2);
      expect(overlayNotifier.banner!.backgroundColour, Colors.green);
    });
  });

  test("showBanner hide the OverlayBanner", () {
    var overlayBanner = const OverlayBanner(body: Text("TESTING"));
    var overlayNotifier = OverlayNotifier();
    overlayNotifier.showBanner(banner: overlayBanner);
    expect(overlayNotifier.banner, isNotNull);
    overlayNotifier.hideBanner();
    expect(overlayNotifier.banner, isNull);
  });

  test("showBanner autoDismiss the OverlayBanner", () async {
    var overlayBanner = const OverlayBanner(body: Text("TESTING"));
    var overlayNotifier = OverlayNotifier();
    overlayNotifier.showBanner(
        banner: overlayBanner, autoDismissTime: const Duration(seconds: 2));
    expect(overlayNotifier.banner, isNotNull);
    await Future.delayed(
      const Duration(seconds: 5),
    );
    expect(overlayNotifier.banner, isNull);
  });
}
