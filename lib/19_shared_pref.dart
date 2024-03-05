import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends StatefulWidget {
  const Shared({super.key});

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  @override
  void initState() {
    SharedPrefHelper.init();
    super.initState();
  }

  String? name;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (name != null) Text(name!),
              ElevatedButton(
                  onPressed: () {
                    SharedPrefHelper.save('name', 'M');
                  },
                  child: const Text('save')),
              ElevatedButton(
                  onPressed: () {
                    name = SharedPrefHelper.read('name');
                    setState(() {});
                  },
                  child: const Text('Read')),
              ElevatedButton(
                  onPressed: () {
                    SharedPrefHelper.delete('name');
                    setState(() {});
                  },
                  child: const Text('delete')),
            ],
          ),
        ),
      ),
    );
  }
}

class SharedPrefHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    print('SharedPreferences init');
  }

  static void save(String key, dynamic value) {
    if (value is int) {
      prefs.setInt(key, value);
      print('save $key -> $value as int');
    } else if (value is String) {
      prefs.setString(key, value);
      print('save $key -> $value as String');
    }
  }

  static dynamic read(String key) {
    print(prefs.get(key));
    return prefs.get(key);
  }

  static void delete(String key) {
    prefs.remove(key);
    print('delete -> $key');
  }

  static void clearAll() {
    prefs.clear();
  }
}
