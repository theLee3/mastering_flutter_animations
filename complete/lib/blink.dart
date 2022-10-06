import 'package:flutter/material.dart';

class LightTween extends ColorTween {
  LightTween({required this.off, required this.on})
      : super(begin: off, end: off);

  final Color off, on;

  @override
  Color? lerp(double t) {
    if (t > 0.5) return Color.lerp(on, off, 2 * t - 1);
    return Color.lerp(off, on, 2 * t);
  }
}

class BlinkPage extends StatefulWidget {
  const BlinkPage({super.key});

  static const title = 'Blink';

  @override
  State<BlinkPage> createState() => _BlinkPageState();
}

class _BlinkPageState extends State<BlinkPage>
    with SingleTickerProviderStateMixin {
  final onColor = const Color.fromARGB(255, 255, 231, 15);
  // Same RGB as onColor, but transparent. This is better for animating than
  // using Color.transparent, which is actually transparent black.
  final offColor = const Color.fromARGB(0, 255, 231, 15);

  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  );

  final animations = <Animation>[];
  final numberOfLights = 10;

  @override
  void initState() {
    super.initState();
    final tween = LightTween(off: offColor, on: onColor);
    final interval = 1 / numberOfLights;
    for (var i = 0; i < numberOfLights; i++) {
      final begin = interval * i;
      final end = interval * (i + 1);
      animations.add(tween.animate(CurvedAnimation(
        parent: controller,
        curve: Interval(begin, end),
      )));
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = 8 * numberOfLights;
    final lightbulbSize =
        (MediaQuery.of(context).size.width - padding) / numberOfLights;
    return Scaffold(
      appBar: AppBar(title: const Text(BlinkPage.title)),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (controller.isAnimating) {
            controller.stop();
          } else {
            controller.repeat();
          }
        },
        child: SizedBox.expand(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: animations
                  .map((animation) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AnimatedBuilder(
                            animation: animation,
                            builder: (context, _) {
                              return Icon(
                                Icons.lightbulb,
                                color: animation.value,
                                size: lightbulbSize,
                              );
                            }),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
