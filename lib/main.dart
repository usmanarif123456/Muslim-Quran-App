import 'package:flutter/material.dart';
//import 'package:muslim_history_app/home_screen.dart';
import 'package:muslim_history_app/ParentScreens/main_screen.dart';


void main() {
  runApp(const MyApp());
}
List<Map<String, dynamic>> bookmarks = []; // For ⭐ Bookmarked Ayahs

Map<String, dynamic>? lastReadAyah; // For 📘 Continue Reading Ayah


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Muslim History',
      theme: ThemeData(
scaffoldBackgroundColor: Color(0xFFFDF8F3)
      ),
      //theme: ThemeData(primarySwatch: Colors.green),
      home: MainScreen(),
    );
  }
}
