import 'dart:async';

import 'package:flutter/material.dart';
import 'package:overlay_banner/src/banner/overlay_banner.dart';

class OverlayNotifier extends ChangeNotifier {
  OverlayBanner? _banner;

  void showBanner({required OverlayBanner banner, Duration? autoDismissTime}) {
    _banner = banner;
    notifyListeners();
    if (autoDismissTime != null) {
      Timer(autoDismissTime, () {
        hideBanner();
      });
    }
  }

  void hideBanner() {
    _banner = null;
    notifyListeners();
  }

  OverlayBanner? get banner => _banner;
}
