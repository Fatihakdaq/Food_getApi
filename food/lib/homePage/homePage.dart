// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:food/detailPage/detail_page_Deisng.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          _foodImages(),
          _foofText(context),
          _foodPageNavigator(context),
        ]),
      ),
    );
  }

  Expanded _foodPageNavigator(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          color: Colors.transparent,
          child: IconButton(
            color: Colors.red,
            iconSize: 50,
            icon: const Icon(Icons.arrow_right_alt_sharp),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailPageDeisng(),
                  ));
            },
          ),
        ));
  }

  Expanded _foofText(BuildContext context) {
    return Expanded(
        flex: 3,
        child: Container(
            color: Colors.transparent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text: const TextSpan(
                            text: 'Explore Our',
                            style: TextStyle(color: Colors.black, fontSize: 45, fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: ' Menu ', style: TextStyle(color: Colors.red)),
                          TextSpan(
                              text: 'and',
                              style: TextStyle(color: Colors.black)), TextSpan(
                              text: ' Enjoy ',
                              style: TextStyle(color: Colors.red)), 
                              TextSpan(
                              text: ' Foods ',
                              style: TextStyle(color: Colors.black)), 
                        ])),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'With an extensive menu prepared by talented chefs, fresh quality food',
                    style: Theme.of(context).textTheme.titleSmall,
                    textScaler: TextScaler.noScaling,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ],
              ),
            )));
  }

  Expanded _foodImages() {
    return Expanded(
        flex: 6,
        child: Carousel(
          autoScroll: true,
          height: 600,
          indicatorBarColor: Colors.transparent,
          activateIndicatorColor: Colors.red,
          indicatorBarHeight: 17,
          scrollAxis: Axis.horizontal,
          indicatorBarWidth: 80,
          unActivatedIndicatorColor: Colors.black12,
          items: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/images_png/food1.png')),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/images_png/food2.png')),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage('assets/images_png/food3.png')),
              ),
            )
          ],
        ));
  }
}
