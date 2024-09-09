import 'package:flutter/material.dart';
import 'package:travel_app/screens/onboarding_screen.dart';
import 'package:travel_app/theme.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      theme: const MaterialTheme().light(),
      darkTheme: const MaterialTheme().dark(),
    ),
  );
}
