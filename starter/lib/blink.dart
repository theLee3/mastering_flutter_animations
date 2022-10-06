import 'package:flutter/material.dart';

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

  final numberOfLights = 10;
  var lightsAreOn = false;

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
          setState(() => lightsAreOn = !lightsAreOn);
        },
        child: SizedBox.expand(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < numberOfLights; i++)
                  Icon(Icons.lightbulb,
                      color: lightsAreOn ? onColor : offColor,
                      size: lightbulbSize)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
