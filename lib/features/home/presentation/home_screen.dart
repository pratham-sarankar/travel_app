import 'package:flutter/material.dart';
import 'package:travel_app/features/home/widgets/app_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   left: 0,
            //   bottom: 0,
            //   child: Image.asset(
            //     'assets/Capture.PNG',
            //     fit: BoxFit.fitWidth,
            //     alignment: Alignment.bottomCenter,
            //   ),
            // ),
            const Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: AppBottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}
