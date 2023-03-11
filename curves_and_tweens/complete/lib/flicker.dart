import 'dart:math';

import 'package:flutter/material.dart';

class Flicker extends Curve {
  Flicker();

  final rand = Random();

  @override
  double transformInternal(double t) {
    if (t > 0.3) return t;
    return (t - rand.nextDouble()).abs();
  }
}

class FlickerPage extends StatefulWidget {
  const FlickerPage({super.key});

  static const title = 'Flicker';

  @override
  State<FlickerPage> createState() => _FlickerPageState();
}

class _FlickerPageState extends State<FlickerPage>
    with SingleTickerProviderStateMixin {
  final onColor = const Color.fromARGB(255, 255, 231, 15);
  final offColor = const Color.fromARGB(0, 255, 231, 15);

  var lightIsOn = false;

  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2000),
    reverseDuration: const Duration(milliseconds: 1000),
  );

  late final animation = ColorTween(begin: offColor, end: onColor).animate(
    CurvedAnimation(
      parent: controller,
      curve: Flicker(),
      reverseCurve: Curves.easeOut,
    ),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(FlickerPage.title)),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (lightIsOn) {
            controller.reverse(from: controller.value);
          } else {
            controller.forward(from: controller.value);
          }
          lightIsOn = !lightIsOn;
        },
        child: SizedBox.expand(
          child: Center(
            child: AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                return Icon(
                  Icons.lightbulb,
                  color: animation.value,
                  size: 256,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
