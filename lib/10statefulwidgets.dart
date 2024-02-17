import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class StateFulWidgets extends StatefulWidget {
  const StateFulWidgets({super.key});

  @override
  State<StateFulWidgets> createState() => _StateFulWidgetsState();
}

class _StateFulWidgetsState extends State<StateFulWidgets> {
  double height = 100;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      filePath: 'lib/10statefulwidgets.dart',
      title: 'stateful widget',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              color: color,
              height: height,
              width: height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
                      height = 200;
                    });
                  },
                  child: const Text('Click 200'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
                      height = 100;
                    });
                  },
                  child: const Text('Click 100'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
