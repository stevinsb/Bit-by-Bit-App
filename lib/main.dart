//import 'package:aquaclense/home1.dart';
import 'package:aquaclense/analysis.dart';
import 'package:aquaclense/mainhome.dart';
import 'package:aquaclense/splashscreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aquaclense',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
