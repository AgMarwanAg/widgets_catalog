import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _controller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool obscureText = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Forms',
      filePath: 'lib/13forms.dart',
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: _controller,
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 248, 28, 28),
                    fontSize: 16.0,
                  ),
                  cursorColor: Colors.yellow,
                  cursorWidth: 2.0,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  enabled: true,
                  onChanged: (value) {},
                  onEditingComplete: () {
                    print('OnEditingComplete');
                  },
                  onTap: () {
                    print('ON Tap');
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter User Name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'User',
                    hintText: 'UseName',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: _passwordcontroller,
                  obscureText: obscureText,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 248, 28, 28),
                    fontSize: 16.0,
                  ),
                  cursorColor: Colors.yellow,
                  cursorWidth: 2.0,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(obscureText ? Icons.remove_red_eye : Icons.visibility_off),
                      onPressed: () {
                        obscureText = !obscureText;
                        setState(() {});
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('All data okay')));
                }
              },
              child: const Text('submit'),
            )
          ],
        ),
      ),
    );
  }
}
