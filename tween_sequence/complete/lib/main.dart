import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tween Sequence',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tween Sequence'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;

  final slideAnimation = TweenSequence<Offset>([
    TweenSequenceItem(
      tween: Tween(
        begin: Offset.zero,
        end: const Offset(3, 0),
      ),
      weight: 3,
    ),
    TweenSequenceItem(
      tween: Tween(
        begin: const Offset(3, 0),
        end: const Offset(3, 5),
      ),
      weight: 5,
    ),
    TweenSequenceItem(
      tween: Tween(
        begin: const Offset(3, 5),
        end: const Offset(0, 5),
      ),
      weight: 3,
    ),
    TweenSequenceItem(
      tween: Tween(
        begin: const Offset(0, 5),
        end: const Offset(0, 0),
      ),
      weight: 5,
    ),
  ]);

  final scaleAnimation = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 1, end: 2), weight: 1),
    TweenSequenceItem(tween: Tween(begin: 2, end: 1), weight: 1),
  ]);

  final shapeAnimation = TweenSequence<Decoration>([
    TweenSequenceItem(
      tween: DecorationTween(
        begin: const BoxDecoration(
          color: Colors.red,
        ),
        end: const BoxDecoration(
          color: Colors.green,
        ),
      ),
      weight: 3,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: const BoxDecoration(
          color: Colors.green,
        ),
        end: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue,
        ),
      ),
      weight: 5,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.blue,
        ),
        end: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.yellow,
        ),
      ),
      weight: 3,
    ),
    TweenSequenceItem(
      tween: DecorationTween(
        begin: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.yellow,
        ),
        end: const BoxDecoration(
          color: Colors.red,
        ),
      ),
      weight: 5,
    ),
  ]);

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SlideTransition(
        position: animationController.drive(slideAnimation),
        child: ScaleTransition(
          alignment: Alignment.topLeft,
          scale: animationController.drive(scaleAnimation),
          child: DecoratedBoxTransition(
            decoration: animationController.drive(shapeAnimation),
            child: const SizedBox.square(
              dimension: 100,
            ),
          ),
        ),
      ),
    );
  }
}
