import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'welcome.dart';

void main() {
  _setTargetPlatformForDesktop();
  runApp(TapHero());
}

void _setTargetPlatformForDesktop() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
}

class TapHero extends StatefulWidget {

  @override
  _TapHeroState createState() => _TapHeroState();
}

class _TapHeroState extends State<TapHero> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
