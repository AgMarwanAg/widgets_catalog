import 'package:flutter/material.dart';

class ExpandAndFlex extends StatelessWidget {
  const ExpandAndFlex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: double.infinity, height: 200, color: Colors.red),
          Container(width: double.infinity, height: 100, color: Colors.green),
          Flexible(child: Container(width: double.infinity, height: 300, color: Colors.blue)),
          Container(width: MediaQuery.of(context).size.width / 2, height: 100, color: Colors.yellow),
          // const SizedBox(
          //   height: 100,
          // ),
          // Container(width: double.infinity, height: 200, color: Colors.tealAccent),
        ],
      ),
    );
  }
}
