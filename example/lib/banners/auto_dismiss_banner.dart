import 'package:flutter/material.dart';
import 'package:overlay_banner/overlay_banner.dart';

class AutoDismissBanner extends OverlayBanner {
  AutoDismissBanner({Key? key})
      : super(
          key: key,
          backgroundColour: Colors.red,
          leading: const Icon(
            Icons.warning_rounded,
            color: Colors.white,
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
