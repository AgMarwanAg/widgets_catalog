import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Getx extends StatelessWidget {
  const Getx({super.key});

  @override
  Widget build(BuildContext context) {
    final ctr = Get.put(GetxScreenCTR());
    return AppScaffold(
      title: 'Getx',
      filePath: 'lib/16getx.dart',
      body: Center(child: GetBuilder<GetxScreenCTR>(builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                ctr.increment();
              },
              child: const Text('increment'),
            ),
            Text(ctr.counter.toString()),
            ElevatedButton(
              onPressed: () async {
                ctr.decrement();
              },
              child: const Text('decrement'),
            ),
          ],
        );
      })),
    );
  }
}

class GetxScreenCTR extends GetxController {
  int counter = 0;
  void decrement() {
    counter--;
    update();
  }

  void increment() {
    counter++;
    update();
  }
}
