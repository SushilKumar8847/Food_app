import 'package:flutter/material.dart';
import '../helpers/style.dart';
import '../widgets/helper.dart';

class DessertScreen extends StatelessWidget {
  const DessertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColor.primary,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                "Desserts",
                                style: Helper.getTheme(context).headline5,
                              ),
                            ],
                          ),
                        ),
                        // Image.asset(
                        //   Helper.getAssetName("cart.png", "virtual"),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // SearchBar(
                  //   title: "Search Food",
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  DessertCard(
                    image: Image.asset(
                      "images/apple_pie.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "French Apple Pie",
                    shop: "Minute by tuk tuk",
                    rating: "4.9",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DessertCard(
                    image: Image.asset(
                      "images/dessert2.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "Dark Chocolate Cake",
                    shop: "Cakes by Tella",
                    rating: "4.7",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DessertCard(
                    image: Image.asset(
                      "images/dessert4.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "Street Shake",
                    shop: "Cafe Racer",
                    rating: "4.9",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DessertCard(
                    image: Image.asset(
                      "images/dessert5.jpg",
                      fit: BoxFit.cover,
                    ),
                    name: "Fudgy  Brownies",
                    shop: "Minute by tuk tuk",
                    rating: "4.9",
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DessertCard extends StatelessWidget {
  const DessertCard({
    Key? key,
    required String name,
    required String rating,
    required String shop,
    required Image image,
  })  : _name = name,
        _rating = rating,
        _shop = shop,
        _image = image,
        super(key: key);

  final String _name;
  final String _rating;
  final String _shop;
  final Image _image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: _image,
          ),
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.2),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 70,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    style: Helper.getTheme(context).headline4?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "images/star_filled.png",
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _rating,
                        style: const TextStyle(color: AppColor.orange),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        _shop,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          ".",
                          style: TextStyle(color: AppColor.orange),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "Desserts",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
