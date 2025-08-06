import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_application/core/theme/theme.dart';
import 'package:spotify_application/features/auth/view/pages/singup_page.dart';
import 'package:spotify_application/features/auth/viewmodel/auth_viewmodel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final notifier = container.read(authViewModelProvider.notifier);
  await notifier.initSharedPreferences();
  await notifier.getData();
  
  runApp(UncontrolledProviderScope(container: container, child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.darkThemeMode, home: const SingupPage());
  }
}
