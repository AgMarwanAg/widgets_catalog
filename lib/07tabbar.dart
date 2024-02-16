import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      animationDuration: const Duration(seconds: 1),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), child: Text('Page1')),
              Tab(icon: Icon(Icons.account_circle_sharp), child: Text('Page2')),
              Tab(icon: Icon(Icons.abc), child: Text('Page3')),
            ],
          ),
        ),
        body: TabBarView(
          children: const [
            Text('Page1'),
            Text('Page2'),
            Text('Page3'),
          ],
        ),
      ),
    );
  }
}
