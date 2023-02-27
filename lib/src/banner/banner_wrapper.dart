import 'package:flutter/material.dart';
import 'package:overlay_banner/src/banner/overlay_notifier.dart';

class BannerWrapper extends StatefulWidget {
  const BannerWrapper({
    Key? key,
    required this.child,
    required this.overlayNotifier,
    this.animationDuration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final Widget child;
  final OverlayNotifier overlayNotifier;
  final Duration animationDuration;

  @override
  State<BannerWrapper> createState() => _BannerWrapperState();
}

class _BannerWrapperState extends State<BannerWrapper> {
  void overlayListener() => mounted ? setState(() {}) : null;

  @override
  void dispose() {
    widget.overlayNotifier.removeListener(overlayListener);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.overlayNotifier.addListener(overlayListener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: widget.child,
        ),
        AnimatedPositioned(
          left: 0,
          right: 0,
          top: widget.overlayNotifier.banner != null ? 0 : -500,
          duration: widget.animationDuration,
          child: widget.overlayNotifier.banner ?? Container(),
        ),
      ],
    );
  }
}
