import 'package:flutter/material.dart';

import 'blink.dart';
import 'flicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const title = 'Curves & Tweens';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.dark().copyWith(
        elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size.fromWidth(80)),
          ),
        ),
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BlinkPage(),
                      ),
                    );
                  },
                  child: const Text(BlinkPage.title),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FlickerPage(),
                      ),
                    );
                  },
                  child: const Text(FlickerPage.title),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
