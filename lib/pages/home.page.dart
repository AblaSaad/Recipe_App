// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sliderIndex = 0;
  CarouselController carouselControllerEx = CarouselController();
  var listValue = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            )
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          )),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'What Would You like to cook Today?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppions',
                          fontSize: 15),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 329,
                    height: 35,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                        ),
                        label: Text(
                          'Search for recipes',
                          style: TextStyle(color: Color.fromARGB(66, 0, 0, 0)),
                        ),
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  )),
              SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  CarouselSlider(
                    carouselController: carouselControllerEx,
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (index, _) {
                        sliderIndex = index;

                        setState(() {});
                      },
                    ),
                    items: listValue.map((i) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ));
                    }).toList(),
                  ),
                  Center(
                    heightFactor: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Use the controller to change the current page
                            carouselControllerEx.previousPage();
                          },
                          icon: Icon(Icons.arrow_back_ios_new_outlined),
                        ),
                        IconButton(
                          onPressed: () {
                            // Use the controller to change the current page
                            carouselControllerEx.nextPage();
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              DotsIndicator(
                dotsCount: listValue.length,
                position: sliderIndex,
                onTap: (position) async {
                  await carouselControllerEx.animateToPage(position);
                  sliderIndex = position;
                  setState(() {});
                },
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Today's Fresh Recipes",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
