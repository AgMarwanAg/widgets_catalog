import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Sqflite extends StatefulWidget {
  const Sqflite({super.key});

  @override
  State<Sqflite> createState() => _SqfliteState();
}

class _SqfliteState extends State<Sqflite> {
  @override
  Widget build(BuildContext context) {
    return   AppScaffold(
      title: 'Sqflite',
      filePath: 'lib/18sqflite.dart',
      body:Column(
        
      )
    );
  }
}