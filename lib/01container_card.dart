import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Container(
            width: 100.0,
            height: 200.0,
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.all(16.0),
            transform: Matrix4.rotationZ(0.1),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 245, 21, 21),
                  blurRadius: 20,
                  offset: Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              // Size, padding, and margin
              width: 250,
              height: 200,
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.blue[200],
                border: Border.all(color: Colors.black, width: 2),
                // shape: BoxShape.circle,
                gradient: const LinearGradient(
                  // begin: Alignment.topCenter,
                  // end: Alignment.bottomCenter,
                  colors: [
                    Colors.green,
                    Colors.red,
                    Colors.blue,
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 7,
                    offset: Offset(2, 3),
                  )
                ],
              ),
              // transform: Matrix4.rotationZ(0.1),
            ),
          ),
          Card(
            elevation: 8.0,
            borderOnForeground: true,
            clipBehavior: Clip.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),

            // shape: const StadiumBorder(
            //   side: BorderSide(color: Colors.green, width: 5),
            // ),
            // shape: const CircleBorder(eccentricity: 0.5),
            // clipBehavior: Clip.antiAlias,
            shadowColor: Colors.purple,
            margin: const EdgeInsets.all(16.0),
            color: Colors.blue[200],
            child: const SizedBox(
              width: double.infinity,
              height: 100,
              child: Text('Card'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      
                      leading: Icon(Icons.album),
                      title: Text('The Enchanted Nightingale'),
                      subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('BUY TICKETS'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('LISTEN'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.add),
              Icon(Icons.remove),
              Icon(Icons.edit),
            ],
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.add),
              Icon(Icons.remove),
              Icon(Icons.edit),
            ],
          ),
          Stack(
            
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                color: Colors.blue,
                width: 150,
                height: 150,
              ),
              Container(
                color: Colors.green,
                width: 120,
                height: 120,
              ),
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              )
            ],
          )
        ], //!END
      ),
    );
  }
}
