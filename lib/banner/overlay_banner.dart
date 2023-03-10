import 'package:flutter/material.dart';

class OverlayBanner extends StatelessWidget {
  const OverlayBanner.warning({
    Key? key,
    this.leading,
    required this.body,
    this.trailing,
    this.backgroundColour = Colors.red,
  }) : super(key: key);

  const OverlayBanner.success({
    Key? key,
    this.leading,
    required this.body,
    this.trailing,
    this.backgroundColour = Colors.green,
  }) : super(key: key);

  const OverlayBanner.update({
    Key? key,
    this.leading,
    required this.body,
    this.trailing,
    this.backgroundColour = Colors.orange,
  }) : super(key: key);

  const OverlayBanner({
    Key? key,
    this.backgroundColour,
    this.leading,
    required this.body,
    this.trailing,
  }) : super(key: key);

  final Widget? leading;
  final Color? backgroundColour;
  final Widget body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).viewPadding.top,
          color: backgroundColour,
        ),
        Container(
          decoration: BoxDecoration(color: backgroundColour),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 11.0,
                        bottom: 11.0,
                        right: 14.0,
                      ),
                      child: leading,
                    ),
                    body,
                  ],
                ),
                trailing ?? Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
