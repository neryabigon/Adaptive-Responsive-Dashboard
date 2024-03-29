import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:responsivedashboard/responsive/desktop_body.dart';
import 'package:responsivedashboard/responsive/tablet_body.dart';
import 'responsive/mobile_body.dart';
import 'responsive/responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;

  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( useMaterial3: true, brightness: Brightness.light, colorSchemeSeed: Colors.blueGrey, ),
      darkTheme: ThemeData( useMaterial3: true, brightness: Brightness.dark, colorSchemeSeed: Colors.blueGrey, ),
      themeMode: themeMode,
      home: ResponsiveLayout(
        mobileBody: MobileScaffold(useLightMode: useLightMode, handleBrightnessChange: handleBrightnessChange),
        tabletBody: TabletScaffold(useLightMode: useLightMode, handleBrightnessChange: handleBrightnessChange),
        desktopBody: DesktopScaffold(useLightMode: useLightMode, handleBrightnessChange: handleBrightnessChange),
      ),
    );
  }
}

