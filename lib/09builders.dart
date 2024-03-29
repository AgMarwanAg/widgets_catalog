import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Builders extends StatelessWidget {
  const Builders({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      filePath: 'lib/09builders.dart',
      title: 'Builders',
      body: SizedBox(
        height: 500,
        child: Column(
          children: [
            Container(
              color: Colors.red,
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Chip(
                      label: Text('data $index'),
                      avatar: const Icon(Icons.add),
                    );
                  }),
            ),
            Expanded(
              child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), children: const [
                Card(
                  child: Center(
                    child: Text('data'),
                  ),
                ),
                Card(
                  child: Center(
                    child: Text('data'),
                  ),
                ),
                Card(
                  child: Center(
                    child: Text('data'),
                  ),
                ),
                Card(
                  child: Center(
                    child: Text('data'),
                  ),
                )
              ]),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                // mainAxisSpacing: 10,
                children: const [
                  Card(
                    child: Center(
                      child: Text('data'),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text('data'),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text('data'),
                    ),
                  ),
                  Card(
                    child: Center(
                      child: Text('data'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 2,
              itemBuilder: (context, index) {
                return const Card(
                    child: Center(
                  child: Text('data'),
                ));
              },
            )),
          ],
        ),
      ),
    );
  }
}
