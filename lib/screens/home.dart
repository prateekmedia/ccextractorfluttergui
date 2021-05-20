// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_rail/navigation_rail.dart';

// Project imports:
import 'package:ccxgui/screens/dashboard/dashboard.dart';
import 'package:ccxgui/screens/settings/basic_settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final navigatorKey = GlobalKey<NavigatorState>();
  int _currentIndex = 0;
  final String logo = 'assets/ccx.svg';
  @override
  Widget build(BuildContext context) {
    return NavRail(
      desktopBreakpoint: 1150,
      hideTitleBar: true,
      drawerHeaderBuilder: (context) {
        return Column(
          children: <Widget>[
            DrawerHeader(
              child: SvgPicture.asset(
                logo,
                semanticsLabel: 'CCExtractor Logo',
              ),
            ),
          ],
        );
      },
      currentIndex: _currentIndex,
      onTap: (val) {
        if (mounted) {
          setState(() {
            _currentIndex = val;
          });
        }
      },
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Dashboard(),
          BasicSettingsScreen(),
          Container(color: Colors.purple[300]),
          Container(color: Colors.grey[300]),
        ],
      ),
      tabs: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Dashboard',
          icon: Icon(Icons.dashboard),
        ),
        BottomNavigationBarItem(
          label: 'Basic Settings',
          icon: Icon(Icons.settings),
        ),
        BottomNavigationBarItem(
          label: 'Advanced Settings',
          icon: Icon(Icons.folder),
        ),
        BottomNavigationBarItem(
          label: 'Obscure Settings',
          icon: Icon(Icons.camera),
        ),
      ],
    );
  }
}
