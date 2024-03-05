import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class Dialogs extends StatefulWidget {
  const Dialogs({super.key});

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  DateTime? dateValue;
  TimeOfDay? timeValue;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      filePath: 'lib/14dialogs.dart',
      title: 'Dialogs',
      body: Column(children: [
        ElevatedButton(
            child: const Text('Show AlertDialog'),
            onPressed: () {
              showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Welcome'),
                    content: const Text('Text'),
                    actions: [
                      TextButton(
                        onPressed: () {},
                        child: const Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('ACCEPT'),
                      ),
                    ],
                  );
                },
              );
            }),
        const SizedBox(height: 10.0),
        ElevatedButton(
            child: const Text('Show SimpleDialog'),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text('Choose an option'),
                    children: <Widget>[
                      SimpleDialogOption(
                        onPressed: () {},
                        child: const Text('Option 1'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {},
                        child: const Text('Option 2'),
                      ),
                    ],
                  );
                },
              );
            }),
        const SizedBox(height: 10.0),
        ElevatedButton(
            child: const Text('Show BottomSheet'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.email),
                          title: const Text('Send Email'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.phone),
                          title: const Text('Make a Call'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.message),
                          title: const Text('Send Message'),
                          onTap: () {
                            // Handle sending a message
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
        ElevatedButton(
            onPressed: () async {
              dateValue = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime(2025),
              );
              setState(() {});
            },
            child: const Text('DatePickerDialog')),
        Text(dateValue.toString()),
        ElevatedButton(
            onPressed: () async {
              timeValue = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              setState(() {});
            },
            child: const Text('TimePickerDialog')),
        Text(timeValue.toString()),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text('Hello'),
              ),
            );
          },
          child: const Text('Show Snackbar'),
        )
      ]),
      
    );
  }
}
