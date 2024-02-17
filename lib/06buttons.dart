import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Buttons',
      filePath: 'lib/06buttons.dart',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  alignment: Alignment.bottomLeft,
                  elevation: 20,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
                  shadowColor: Colors.blueAccent,
                  side: const BorderSide(color: Colors.green, width: 2)),
              onLongPress: () {
                print('Long Press');
              },
              onPressed: () {
                print('Elevated Button');
              },
              child: const Text('Elevated Button'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.new_label), label: const Text('data')),
            OutlinedButton(
              onPressed: () {},
              child: const Text('OutlinedButton'),
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.amber,
              child: const Text(
                'MaterialButton',
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            IconButton(iconSize: 30, onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
            FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
            // FloatingActionButton.extended(onPressed: () {}, label: const Text('data'), icon: const Icon(Icons.add)),
            InkWell(
              onTap: () {
                print('InkWell tap');
              },
              child: Container(width: 100, height: 100, color: Colors.amber),
            ),
            GestureDetector(
              onTap: () {
                print('GestureDetector tap');
              },
              child: Container(width: 100, height: 100, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
