import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widgets_catalog/01container_card.dart';
import 'package:widgets_catalog/02expand_and_flex.dart';
import 'package:widgets_catalog/03my_scafflold.dart';
import 'package:widgets_catalog/03my_scaffold_hw.dart';
import 'package:widgets_catalog/04settingui_hw.dart';
import 'package:widgets_catalog/04texts.dart';
import 'package:widgets_catalog/05image_icon.dart';
import 'package:widgets_catalog/06buttons.dart';
import 'package:widgets_catalog/07tabbar.dart';
import 'package:widgets_catalog/08pageview.dart';
import 'package:widgets_catalog/09builders.dart';
import 'package:widgets_catalog/10homescreen_ex.dart';
import 'package:widgets_catalog/12statefulButtons.dart';
import 'package:widgets_catalog/11statefulwidgets.dart';
import 'package:widgets_catalog/14dialogs.dart';
import 'package:widgets_catalog/15navigation.dart';
import 'package:widgets_catalog/16getx.dart';
import 'package:get/get.dart';
import 'package:widgets_catalog/17apis.dart';
import 'package:widgets_catalog/18sqflite.dart';
import 'package:widgets_catalog/19_shared_pref.dart';

import '13forms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Widget Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Widget Catalog'),
      routes: {
        '/screen2': (context) => const ScreenTwo(),
        '/Navigation': (context) => const Navigation(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('basic widgets'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20,
        children: const [
          // NavigationButton(label: 'Test', page: Test()),
          NavigationButton(label: 'card and container', page: ContainerCard()),
          NavigationButton(label: 'Expand and flex', page: ExpandAndFlex()),
          NavigationButton(label: 'Scaffold', page: MyScaffold()),
          NavigationButton(label: 'ScaffoldHW', page: MyScaffoldHW()),
          NavigationButton(label: 'Setting UI homework', page: SettingUIhomework()),
          NavigationButton(label: 'Texts', page: Texts()),
          NavigationButton(label: 'Images and Icons', page: ImageAndIcon()),
          NavigationButton(label: 'Buttons', page: Buttons()),
          NavigationButton(label: 'Tab Bar', page: AppTabBar()),
          NavigationButton(label: 'Page Bar', page: AppPageView()),
          NavigationButton(label: 'Builders', page: Builders()),
          NavigationButton(label: 'HomeScreen Ex', page: HomeScreenEx()),
          NavigationButton(label: 'Stateful Widgets', page: StateFulWidgets()),
          NavigationButton(label: 'Stateful buttons', page: StatefulBubuttons()),
          NavigationButton(label: 'Forms', page: Forms()),
          NavigationButton(label: 'Dialogs', page: Dialogs()),
          NavigationButton(label: 'Navigation', page: Navigation()),
          NavigationButton(label: 'Getx', page: Getx()),
          NavigationButton(label: 'Apis', page: Apis()),
          NavigationButton(label: 'sqflite', page: Sqflite()),
          NavigationButton(label: 'SharedPreferences', page: Shared()),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    required this.page,
    required this.label,
    super.key,
  });
  final Widget page;
  final String label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Material(
          elevation: 20,
          color: Colors.transparent,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
                    Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 0.5),
                    Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
                  ],
                ),
                // boxShadow: const [
                //   // BoxShadow(color: Colors.black, offset: Offset(2, 2)),
                // ],
              ),
              child: Center(
                  child: Text(
                label,
                style: const TextStyle(color: Colors.white, shadows: [
                  Shadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 10),
                ]),
                textAlign: TextAlign.center,
              ))),
        ));
  }
}
