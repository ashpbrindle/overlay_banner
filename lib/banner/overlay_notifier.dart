import 'dart:async';

import 'package:flutter/material.dart';
import 'package:overlay_banner/banner/overlay_banner.dart';

class OverlayNotifier extends ChangeNotifier {
  OverlayBanner? banner;

  void showBanner(OverlayBanner newBanner, {bool autoDismiss = false}) {
    banner = newBanner;
    notifyListeners();
    if (autoDismiss) {
      Timer(const Duration(seconds: 3), () {
        hideBanner();
      });
    }
  }

  void hideBanner() {
    banner = null;
    notifyListeners();
  }
}
