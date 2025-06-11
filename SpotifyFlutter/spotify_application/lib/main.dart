import 'package:flutter/material.dart';
import 'package:spotify_application/core/theme/theme.dart';
import 'package:spotify_application/features/auth/view/pages/login_page.dart';
import 'package:spotify_application/features/auth/view/pages/singup_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.darkThemeMode, home: const SingupPage());
  }
}
