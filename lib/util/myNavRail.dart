import 'package:flutter/material.dart';

class MyNavRail extends StatefulWidget {
  const MyNavRail({Key? key}) : super(key: key);

  @override
  State<MyNavRail> createState() => _MyNavRailState();
}

class _MyNavRailState extends State<MyNavRail> {
  bool extanded = false;
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: const Icon(Icons.menu),
      onDestinationSelected: (int index) {
        if (index == 0) {
          Navigator.pushNamed(context, '/dashboard');
        } else if (index == 1) {
          Navigator.pushNamed(context, '/settings');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/about');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/logout');
        } else if (index == 4) {
          setState(() {
            extanded = !extanded;
          });
        }
      },
      destinations: [
        const NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Dashboard'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.info),
          label: Text('About'),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.logout),
          label: Text('Logout'),
        ),
        NavigationRailDestination(
          icon: extanded ? Icon(Icons.arrow_left) : Icon(Icons.arrow_right),
          label: extanded ? Text('collapse') : Text('expand'),
        ),
      ],
      selectedIndex: 0,
      extended: extanded,
    );;
  }
}
