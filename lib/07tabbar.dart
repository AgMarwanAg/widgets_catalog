import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'TabBar',
      filePath: 'lib/07tabbar.dart',
      body: SizedBox(
        height: 500,
        child: DefaultTabController(
          length: 3,
          animationDuration: const Duration(seconds: 1),
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              leading: const SizedBox.shrink(),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home), child: Text('Page1')),
                  Tab(icon: Icon(Icons.account_circle_sharp), child: Text('Page2')),
                  Tab(icon: Icon(Icons.abc), child: Text('Page3')),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                Text('Page1'),
                Text('Page2'),
                Text('Page3'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
