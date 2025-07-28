import 'package:flutter/material.dart';
import 'package:muslim_history_app/ParentScreens/Azkaarscreen.dart';
import 'package:muslim_history_app/ParentScreens/Hadithscreen.dart';
import 'package:muslim_history_app/ParentScreens/settings.dart';
import 'package:muslim_history_app/ParentScreens/Quran_Screen.dart';
import 'package:muslim_history_app/ParentScreens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    QuranScreen(),
    HadithScreens(),
    AzkaarScreen(),
  SettingsScreen()
  ];

  final List<BottomNavigationBarItem> _bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Quran'),
    BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Hadith'),
    BottomNavigationBarItem(icon: Icon(Icons.access_time), label: 'Azkaar'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: _bottomItems,
          selectedItemColor: Color(0xFF6A4D3B),
          unselectedItemColor: Color(0xFF6C757D),
        ));
  }
}
