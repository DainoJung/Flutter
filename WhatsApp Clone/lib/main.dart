import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/common/theme/dark_theme.dart';
import 'package:flutter_complete_guide/common/theme/light_theme.dart';
import 'package:flutter_complete_guide/feature/auth/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Me',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}
