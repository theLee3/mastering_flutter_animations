import 'package:flutter/material.dart';

class SingleAnimatedWidgetDemo extends StatefulWidget {
  const SingleAnimatedWidgetDemo({Key? key}) : super(key: key);

  @override
  State<SingleAnimatedWidgetDemo> createState() =>
      _SingleAnimatedWidgetDemoState();
}

class _SingleAnimatedWidgetDemoState extends State<SingleAnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  final alignTween = Tween(begin: Alignment.topLeft, end: Alignment.center)
      .chain(CurveTween(curve: const Interval(0.0, 0.75)));
  final rotationTween = Tween(begin: 0.0, end: 1.0)
      .chain(CurveTween(curve: const Interval(0.25, 1.0)));
  final scaleTween = Tween(begin: 1.0, end: 4.0).chain(
      CurveTween(curve: const Interval(0.0, 0.9, curve: Curves.bounceIn)));

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    Future.delayed(Duration.zero, () => animationController.forward());
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AlignTransition(
            alignment: animationController.drive(alignTween),
            child: RotationTransition(
              turns: animationController.drive(rotationTween),
              child: ScaleTransition(
                scale: animationController.drive(scaleTween),
                child: const ColoredBox(
                  color: Colors.red,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.forward(from: 0.0);
        },
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
