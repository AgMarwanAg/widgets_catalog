import 'package:flutter/material.dart';
import 'package:widgets_catalog/00test.dart';
 
class AppPageView extends StatelessWidget {
  const AppPageView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageCTR = PageController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView'),
      ),
      body: PageView(

        controller:pageCTR,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.red,
            child: Center(
              child: OutlinedButton(
                  onPressed: () {
                   pageCTR.animateToPage(1, duration: const Duration(seconds: 1), curve: Curves.easeIn);
                  },
                  child: const Text('Move to page 2')),
            ),
          ),
          Container(
            color: Colors.green,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                   pageCTR.animateToPage(
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutSine,
                    );
                  },
                  child: const Text('Move to page 1')),
            ),
          ),
        ],
      ),
    );
  }
}
