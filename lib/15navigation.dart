import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Navigation',
      filePath: 'lib/15navigation.dart',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenTwo()),
                );
              },
              child: const Text('Navigate to Screen 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ScreenTwo()),
                );
              },
              child: const Text('Navigate replacement to Screen 2'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/screen2',
                  arguments: 'data from screen 1',
                );
              },
              child: const Text('Navigate and send data'),
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await Navigator.pushNamed(
                  context,
                  '/screen2',
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(data.toString())));
              },
              child: const Text('Retrieve data from screen 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen Two'),
        ),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'data from screen 2');
                  },
                  child: const Text('GO Back')),
            ),
            Text(data ?? 'data not found'),
          ],
        ));
  }
}
