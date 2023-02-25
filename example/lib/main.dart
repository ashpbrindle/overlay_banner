import 'package:example/banners/auto_dismiss_banner.dart';
import 'package:example/banners/dismissable_banner.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_banner/overlay_banner.dart';

void main() {
  GetIt.I.registerLazySingleton<OverlayNotifier>(() => OverlayNotifier());
  runApp(const OverlayBannerDemo());
}

class OverlayBannerDemo extends StatelessWidget {
  const OverlayBannerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overlay Banner Demo Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Overlay Banner Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BannerWrapper(
      overlayNotifier: GetIt.I.get(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  GetIt.I
                      .get<OverlayNotifier>()
                      .showBanner(DismissibleBanner());
                },
                child: const Text("Trigger Dismissible Banner"),
              ),
              ElevatedButton(
                onPressed: () {
                  GetIt.I.get<OverlayNotifier>().showBanner(
                        AutoDismissBanner(),
                        autoDismiss: true,
                      );
                },
                child: const Text("Trigger Auto Dismiss Banner"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
