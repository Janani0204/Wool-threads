import 'package:flutter/material.dart';
import 'package:wool_threads/firebase_options.dart';
import 'splash_screen.dart'; 
import 'package:firebase_core/firebase_core.dart';// Import the splash screen


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wool Supply Chain',
      theme: ThemeData(
        primaryColor: Colors.white,  // <-- Set primary color to white here
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
