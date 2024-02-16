import 'package:flutter/material.dart';

class Texts extends StatefulWidget {
  const Texts({super.key});

  @override
  State<Texts> createState() => _TextsState();
}

class _TextsState extends State<Texts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                const Text(
                  "Hello World! This is a Text Widget.",
                  style: TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.clip,
                    color: Colors.purple,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 8,
                    wordSpacing: 20,
                    backgroundColor: Colors.yellow,
                    shadows: [
                      Shadow(
                        color: Colors.blueAccent,
                        offset: Offset(5, 3),
                        blurRadius: 40,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Don\'t have a\\n account?',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign up',
                        style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                      ),
                      TextSpan(
                        text: ' or ',
                      ),
                      TextSpan(
                        text: ' Login',
                        style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    children: [
                      TextSpan(
                        text: ' press',
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      WidgetSpan(child: Icon(Icons.add)),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
