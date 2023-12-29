// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:recipe_app_/widget/fresh_recipes_widget.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'What Would You like to cook Today?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 5,
                          ),
                          child: Row(children: const [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 4,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Search for recipes",
                                  hintStyle: TextStyle(
                                      fontSize: 8,
                                      color:
                                          Color.fromARGB(255, 158, 158, 158)),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ])),
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Image(
                              image: AssetImage('assets/images/filter.png')))
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "Today's Fresh Recipes",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
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
                  height: 15,
                ),
                Align(alignment: Alignment.centerLeft, child: FreshRecipes()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
