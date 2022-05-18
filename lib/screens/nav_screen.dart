import 'package:flutter/material.dart';

import './home_screen.dart';
import '../widgets/responsive.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu
  };

  var _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: !Responsive.isDesktop(context)
        ?
      BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: _icons.map((title, icon) {
          return MapEntry(title,
            BottomNavigationBarItem(
              icon: Icon(icon, size: 30.0),
              label: title,
              tooltip: title
            )
          );
        }).values.toList(),
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11.0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
        :
      null
    );
  }
}
