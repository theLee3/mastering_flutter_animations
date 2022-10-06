import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(FlickerPage.title)),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() => lightIsOn = !lightIsOn);
        },
        child: SizedBox.expand(
          child: Center(
            child: Icon(
              Icons.lightbulb,
              color: lightIsOn ? onColor : offColor,
              size: 256,
            ),
          ),
        ),
      ),
    );
  }
}
