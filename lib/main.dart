import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/screens/home_screen.dart';

import 'core/notification_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initialize();
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black54),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      themeMode: ThemeMode.system, // Auto switch based on system preference
      home: HomeScreen(),
    );
  }
}

// Folder Structure:
// - lib/
//   - core/ (Common utilities, themes, database helper)
//   - data/ (Repositories, SQLite integration)
//   - domain/ (Entities, use cases, repository interfaces)
//   - presentation/ (UI screens, controllers)


