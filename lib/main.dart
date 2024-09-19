import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:travel_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Enable Edge to Edge
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
      theme: const MaterialTheme().light(),
      darkTheme: const MaterialTheme().dark(),
    ),
  );
}
