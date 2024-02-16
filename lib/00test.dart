import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080808),
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: const Text(
          'Setting',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
        ),
        backgroundColor: const Color(0xFF080808),
        actions: const [
          Icon(
            Icons.search,
            color: Color(0xFFf9f9f9),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Color(0xFF008cff),
            // minRadius: 20,
            maxRadius: 15,
            child: Icon(
              Icons.person,
              color: Color(
                0xFF080808,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //     bottomLeft: Radius.circular(20),
        //     bottomRight: Radius.circular(20),
        //   ),
        // ),
        // bottom: PreferredSize(
        //   preferredSize: const Size.fromHeight(40.0), // Set custom height for the bottom widget
        //   child: Container(
        //     alignment: Alignment.center,
        //     // color: const Color.fromARGB(255, 255, 0, 0),
        //     child: const Text('Bottom Widget'),
        //     // Your bottom widget goes here
        //   ),
        // ),
      ),
      body: const Column(
        children: [
          Item(
            icon: Icons.wifi,
            color: Color(0xFF52a4ff),
            title: 'Connection',
            subTile: 'Wi-Fi, Bluetooth, Data usage, Airplane mode',
          ),
          Item(
            icon: Icons.volume_up,
            color: Color(0xFF8c84f3),
            title: 'Sound and Vibration',
            subTile: 'Sound mode, Bluetooth, RingTone, Volume',
          )
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({
    required this.icon,
    required this.color,
    required this.title,
    required this.subTile,
    this.titleColor = const Color(0xFFfafafa),
    this.subTileColor = const Color(0xFF8f8f8f),
    super.key,
  });
  final String title;
  final String subTile;
  final IconData? icon;
  final Color color;
  final Color titleColor;
  final Color subTileColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        // height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF252525),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(color: titleColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 250,
                  child: Text(
                    subTile,
                    style: TextStyle(
                      fontSize: 13,
                      color: subTileColor,
                      fontWeight: FontWeight.w100,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
