import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thesis_application_v1/auth/auth.dart';
import 'package:thesis_application_v1/theme/dark_mode.dart';
import 'package:thesis_application_v1/firebase_options.dart';
import 'package:thesis_application_v1/theme/light_mode.dart';
import 'package:thesis_application_v1/pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
