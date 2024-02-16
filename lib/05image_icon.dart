import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageAndIcon extends StatelessWidget {
  const ImageAndIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView(
            children: [
              const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                Icon(Icons.camera_enhance, size: 70, color: Colors.green),
                Icon(Icons.camera_front, size: 70, color: Colors.orange),
                Icon(
                  Icons.camera_rear,
                  size: 70,
                  color: Colors.black,
                ),
              ]),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.camera_rear,
                    size: 40,
                    color: Colors.green,
                    shadows: [
                      Shadow(color: Colors.red, offset: Offset(10, 10), blurRadius: 10),
                      Shadow(color: Colors.green, offset: Offset(-10, 0), blurRadius: 4),
                    ],
                  ),
                  Icon(
                    Icons.camera_rear,
                    size: 40,
                    color: Colors.green,
                    shadows: [
                      Shadow(color: Colors.red, offset: Offset(10, 10), blurRadius: 10),
                      Shadow(color: Colors.green, offset: Offset(-10, 0), blurRadius: 4),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                width: 300,
                height: 120,
                child: Image.asset(
                  'assets/cat.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 200,
                height: 120,
                child: Image.network(
                  'https://picsum.photos/250?image=201',
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/error.png', width: 100, height: 100, fit: BoxFit.fill);
                  },
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: 200,
                height: 120,
                child: FadeInImage.assetNetwork(
                  image: 'https://picsum.photos/250?image=110',
                  placeholder: 'assets/cat.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Material(
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)), side: BorderSide(width: 2, color: Colors.green)),
                child: CachedNetworkImage(
                  imageUrl: "https://picsum.photos/250?image=110",
                  // progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                  placeholder: (context, url) => const Icon(Icons.place_outlined),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),
        ));
  }
}
