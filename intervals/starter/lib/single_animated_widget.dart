import 'package:flutter/material.dart';

class SingleAnimatedWidgetDemo extends StatefulWidget {
  const SingleAnimatedWidgetDemo({Key? key}) : super(key: key);

  @override
  State<SingleAnimatedWidgetDemo> createState() =>
      _SingleAnimatedWidgetDemoState();
}

class _SingleAnimatedWidgetDemoState extends State<SingleAnimatedWidgetDemo>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}
