import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'presentation/screens/main_screen.dart';

void main() {
  runApp(const SozEgitimApp());
}

class SozEgitimApp extends StatelessWidget {
  const SozEgitimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SözEğitim',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}
