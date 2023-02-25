import 'package:flutter/material.dart';
import 'package:overlay_banner/banner/overlay_notifier.dart';

class BannerWrapper extends StatefulWidget {
  const BannerWrapper({
    Key? key,
    required this.child,
    required this.overlayNotifier,
  }) : super(key: key);

  final Widget child;
  final OverlayNotifier overlayNotifier;

  @override
  State<BannerWrapper> createState() => _BannerWrapperState();
}

class _BannerWrapperState extends State<BannerWrapper> {
  @override
  void dispose() {
    widget.overlayNotifier.removeListener(() {});
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.overlayNotifier.addListener(() => mounted ? setState(() {}) : null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: widget.child,
            ),
            AnimatedPositioned(
              left: 0,
              right: 0,
              top: widget.overlayNotifier.banner != null ? 0 : -200,
              duration: const Duration(milliseconds: 200),
              child: widget.overlayNotifier.banner ?? Container(),
            ),
          ],
        ),
      ),
    );
  }
}
