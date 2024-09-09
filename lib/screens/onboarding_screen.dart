import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    )..forward();
    _animation = Tween<double>(
      begin: -0.5,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInExpo,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: Container(
        height: 90,
        width: 90,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(CupertinoIcons.arrow_right),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              children: [
                SlideTransition(
                  position: Tween(
                    begin: const Offset(0, -0.2),
                    end: const Offset(0, 0),
                  ).animate(
                    CurvedAnimation(parent: _controller, curve: Curves.easeIn),
                  ),
                  child: Container(
                    height: height * 0.605,
                    width: width,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage(
                          "assets/onboarding.jpg",
                        ),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                      shape: OnBoardingImageShape(tween: _animation.value),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Discover Best \nPlace To Vacation",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                        color: Colors.black,
                        shadows: [
                          const Shadow(
                            color: Colors.black,
                            offset: Offset(1, 0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      "Lorem Ipsum available, but the majority have \nsuffered alteration in some form.",
                      style: TextStyle(
                        fontSize: height * 0.02,
                        height: 1.4,
                        color: const Color(0xff818181),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class OnBoardingImageShape extends ShapeBorder {
  final double tween;

  const OnBoardingImageShape({required this.tween});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsetsGeometry.infinity;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect r, {TextDirection? textDirection}) {
    final path = Path()
      ..moveTo(r.left, r.top)
      ..lineTo(r.left, r.bottom - (r.height * 0.128))
      ..relativeConicTo(
          r.width * 0.135, r.height * 0.22 * tween, r.width * 0.44, 0, 1.4)
      ..relativeConicTo(
          r.width * 0.135, -r.height * 0.08 * tween, r.width * 0.26, 0, 1.4)
      ..relativeConicTo(
          r.width * 0.15, r.height * 0.125 * tween, r.width * 0.275, 0, 1)
      ..relativeLineTo(r.width * 0.025, -r.height * 0.035 * tween)
      ..lineTo(r.right, r.top)
      ..close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return OnBoardingImageShape(tween: tween);
  }
}
