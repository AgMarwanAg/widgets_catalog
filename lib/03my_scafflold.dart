import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int selectedTap = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140.0),
        child: AppBar(
          title: const Text(
            'Appbar Text',
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          actions: const [Icon(Icons.add), Icon(Icons.remove)],
          elevation: 20,
          // leading: const Icon(Icons.search),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40.0), // Set custom height for the bottom widget
            child: Container(
              alignment: Alignment.center,
              // color: const Color.fromARGB(255, 255, 0, 0),
              child: const Text('Bottom Widget'),
              // Your bottom widget goes here
            ),
          ),
          bottomOpacity: 0.5,
        ),
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.send), onPressed: () {}),
      drawer: Drawer(
        elevation: 20,
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {});
            selectedTap = value;
          },
          currentIndex: selectedTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
          ]),
      backgroundColor: Colors.red,
    );
  }
}
