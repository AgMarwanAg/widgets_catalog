import 'package:flutter/material.dart';

class MyScaffoldHW extends StatelessWidget {
  const MyScaffoldHW({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: AppBar(
            title: const Text(
              'Scaffold HW',
              style: TextStyle(color: Colors.white),
            ),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.pinkAccent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40.0),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Bottom Widget',
                  style: TextStyle(color: Colors.white),
                ),
                // Your bottom widget goes here
              ),
            ),
          ),
        ),
        drawer: Drawer(
          
          child: Column(
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 226, 94, 138),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 245, 195, 212),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Name:- ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromARGB(255, 245, 195, 212),
                                      ),
                                    ),
                                    Text(
                                      'Marwan',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Marwan@gmail.com ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromARGB(255, 245, 195, 212),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 40,
                          ),
                        ],
                      )
                    ],
                  )),
              const ListTile(
                leading: Icon(
                  Icons.drive_file_move_outline,
                  color: Color.fromARGB(255, 226, 94, 138),
                  size: 40,
                ),
                title: Text('files'),
              ),
              const ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Color.fromARGB(255, 226, 94, 138),
                    size: 40,
                  ),
                  title: Text('Home')),
              const ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Color.fromARGB(255, 226, 94, 138),
                    size: 40,
                  ),
                  title: Text('delete')),
              const Expanded(
                child: SizedBox(
                  height: 300,
                ),
              ),
              const Text('app version 1.0.0')
            ],
          ),
        ),
      ),
    );
  }
}
