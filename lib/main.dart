import 'package:flutter/material.dart';
import 'onboarding_page.dart';

void main() {
  runApp(BudgetApp());
}

class BudgetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget App',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingPage(),
    );
  }
}
