import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic/providers/fitness_provider.dart';
import 'presentation/screens/fitness_home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FitnessProvider()),
      ],
      child: const FitnessTrackerApp(),
    ),
  );
}

class FitnessTrackerApp extends StatelessWidget {
  const FitnessTrackerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
        fontFamily: 'SF Pro Display',
      ),
      home: const FitnessHomePage(),
    );
  }
}
