import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'core/theme.dart';
import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Herbs Store',
      theme: AppTheme.light(),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRoutes.onGenerate,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}






