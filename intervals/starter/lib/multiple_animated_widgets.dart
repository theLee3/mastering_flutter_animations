import 'package:flutter/material.dart';

class MultipleAnimatedWidgetsDemo extends StatefulWidget {
  const MultipleAnimatedWidgetsDemo({Key? key}) : super(key: key);

  @override
  State<MultipleAnimatedWidgetsDemo> createState() =>
      _MultipleAnimatedWidgetsDemoState();
}

class _MultipleAnimatedWidgetsDemoState
    extends State<MultipleAnimatedWidgetsDemo>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: 0,
            end: 0,
            height: 200,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF42A5F5), Color(0Xff1976d2)],
                ),
              ),
            ),
          ),
          Positioned(
            top: 148,
            left: 8,
            child: Text(
              'Staggered Animations',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          const Positioned(
            top: 208,
            left: 8,
            right: 8,
            child: Text(_lipsum, softWrap: true),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
  }
}

const _lipsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
    'tempor incididunt ut labore et dolore magna aliqua. Consectetur purus ut faucibus pulvinar '
    'elementum. Adipiscing elit ut aliquam purus sit amet luctus venenatis. Etiam erat velit '
    'scelerisque in dictum non. Nec nam aliquam sem et. Purus gravida quis blandit turpis. In '
    'eu mi bibendum neque. Lacus laoreet non curabitur gravida arcu ac. Pellentesque elit eget '
    'gravida cum. Blandit volutpat maecenas volutpat blandit. Nibh mauris cursus mattis molestie '
    'a iaculis at erat pellentesque.\n\nId donec ultrices tincidunt arcu non sodales. Aliquet nibh '
    'praesent tristique magna sit amet purus. Porttitor rhoncus dolor purus non enim. Nec '
    'ultrices dui sapien eget mi proin sed. Iaculis at erat pellentesque adipiscing commodo elit. '
    'Lorem donec massa sapien faucibus et molestie ac feugiat sed. Nulla pharetra diam sit amet. '
    'Tortor at auctor urna nunc. Nullam non nisi est sit amet facilisis magna etiam. Cras pulvinar '
    'mattis nunc sed blandit. Et molestie ac feugiat sed lectus vestibulum. Et ultrices neque ornare '
    'aenean euismod elementum nisi quis eleifend. Est pellentesque elit ullamcorper dignissim cras '
    'tincidunt. Lorem ipsum dolor sit amet consectetur adipiscing. Mattis enim ut tellus elementum '
    'sagittis vitae. Pellentesque habitant morbi tristique senectus et. Malesuada fames ac turpis '
    'egestas sed tempus. Proin sagittis nisl rhoncus mattis rhoncus.';
