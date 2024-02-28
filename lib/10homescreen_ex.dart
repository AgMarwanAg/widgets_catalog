import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:widgets_catalog/shared/app_scaffold.dart';

class HomeScreenEx extends StatefulWidget {
  const HomeScreenEx({super.key});

  @override
  State<HomeScreenEx> createState() => _HomeScreenExState();
}

class _HomeScreenExState extends State<HomeScreenEx> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      filePath: 'lib/10homescreen_ex.dart',
      title: 'Home Screen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CarouselSlider(
                items: [
                  SizedBox(width: double.infinity, height: 300, child: Image.asset('assets/cat.png', fit: BoxFit.cover)),
                  SizedBox(width: double.infinity, height: 300, child: Image.asset('assets/error.png', fit: BoxFit.cover)),
                  SizedBox(width: double.infinity, height: 300, child: Image.asset('assets/cat.png', fit: BoxFit.cover)),
                ],
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  aspectRatio: 16 / 9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
              ),
              Positioned(
                bottom: -40,
                right: (MediaQuery.of(context).size.width / 2) - 30,
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return index == currentIndex ? const Icon(Icons.circle, color: Colors.blue) : const Icon(Icons.circle, color: Colors.grey);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Icon(Icons.add),
                  );
                }),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              width: 100,
              height: 150,
              child: Card(
                child: Column(
                  children: [
                    Image.asset('assets/cat.png'),
                    const Center(
                      child: Text('data'),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Icon(Icons.home),
            Icon(Icons.home),
            Icon(Icons.home),
            Icon(Icons.home),
          ])),
      floatingActionButton: const CircleAvatar(
        maxRadius: 30,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
