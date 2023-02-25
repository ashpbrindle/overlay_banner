import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_banner/overlay_banner.dart';

class DismissibleBanner extends OverlayBanner {
  DismissibleBanner({
    Key? key,
  }) : super(
          key: key,
          backgroundColour: Colors.red,
          trailing: GestureDetector(
            child: const Icon(Icons.close, color: Colors.white),
            onTap: () => GetIt.I.get<OverlayNotifier>().hideBanner(),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Testing 123",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "This is a test for description",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
}
