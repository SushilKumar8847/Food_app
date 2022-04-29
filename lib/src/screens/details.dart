import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:food_app/src/helpers/style.dart';
import 'package:food_app/src/models/products.dart';
import 'package:food_app/src/widgets/custom_text.dart';

class Details extends StatefulWidget {
  final Product products;
  final List<String> img;
  final List<String> name;
  const Details({
    Key? key,
    required this.products,
    required this.img,
    required this.name,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List<String> nameList = [
    "chola",
    "kachori",
    "curry",
    "poha",
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.img
        .map((item) => Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        item,
                        fit: BoxFit.cover,
                        width: 1000.0,
                        height: 900,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 150, 60, 0),
                                Color.fromARGB(100, 200, 90, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.name[widget.img.indexOf(item)],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                          color: grey.shade300,
                                          offset: const Offset(1, 1),
                                          blurRadius: 4)
                                    ]),
                                child: IconButton(
                                    icon: const Icon(Icons.favorite),
                                    color: red,
                                    iconSize: 22,
                                    onPressed: () {}),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: IconButton(
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        size: 40,
                      )),
                ),
                Positioned(
                  top: 13,
                  right: 25,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.cyan.shade100,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: CustomText(
                        text: "99+",
                        color: black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        children: const [Icon(Icons.account_box)],
      ),
      backgroundColor: white,
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 2.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.img.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.black
                                      : Colors.red)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
          CustomText(
            text: widget.products.name,
            size: 24,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: "\$" + widget.products.price.toString(),
            size: 18,
            weight: FontWeight.w500,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove),
                  iconSize: 25,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(color: red),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(28, 12, 28, 12),
                    child: CustomText(
                      text: "Add to bag",
                      color: white,
                      size: 22,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  color: red,
                  iconSize: 25,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
