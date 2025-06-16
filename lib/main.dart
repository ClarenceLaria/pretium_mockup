import 'package:flutter/material.dart';
import 'package:pretium/core/theme.dart';
import 'package:pretium/screens/onboarding_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized()); // Preserve the splash screen while the app is initializing

  await Future.delayed(const Duration(seconds: 3)); // Simulate a delay for the splash screen

  FlutterNativeSplash.remove(); // Remove the splash screen after a delay
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pretium Africa',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
