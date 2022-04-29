import 'package:flutter/material.dart';
import 'package:food_app/src/helpers/screen_navigation.dart';
import 'package:food_app/src/models/products.dart';
import 'package:food_app/src/screens/details.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

final List imgList = [
  [
    'images/th_001.png',
    'images/th_002.png',
    'images/th_003.png',
    'images/th_004.png',
  ],
  [
    'images/th_013.png',
    'images/th_014.png',
    'images/th_015.png',
    'images/th_016.png',
  ],
  [
    'images/th_005.png',
    'images/th_006.png',
    'images/th_007.png',
    'images/th_008.png',
  ],
  [
    'images/th_009.png',
    'images/th_010.png',
    'images/th_011.png',
    'images/th_012.png',
  ]
];
final List nameList = [
  ["chola", "kachori", "curry", "poha"],
  ["kulcha", "tanduri", "biryani", "cupcake"],
  ["plain Cake", "Pot Cake", "Dum biryani", "ada"],
  ["adswd", "kabcd", "abcd", "efgh"],
];

List<Product> productsList = [
  Product(
      name: "Cereals",
      image: "th_016.png",
      rating: 4.2,
      price: 5.99,
      vendor: "GoodFood",
      wishList: true),
  Product(
      name: "Breakfast",
      image: "th_018.png",
      rating: 4.5,
      price: 7.99,
      vendor: "HealthyFood",
      wishList: false),
  Product(
      name: "Lunch",
      image: "th_019.png",
      rating: 4.1,
      price: 4.99,
      vendor: "HeavyFood",
      wishList: true),
  Product(
      name: "Dinner",
      image: "th_021.png",
      rating: 4.3,
      price: 2.99,
      vendor: "DietFood",
      wishList: true),
  Product(
      name: "Italian",
      image: "th_021.png",
      rating: 4.3,
      price: 2.99,
      vendor: "DietFood",
      wishList: true),
  Product(
    name: "Quick & Easy",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
  Product(
    name: "Humbergers",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
  Product(
    name: "German",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
  Product(
    name: "Exotic",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
  Product(
    name: "Light & Lovely",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
  Product(
    name: "Asian",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
  Product(
    name: "French",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
  Product(
    name: "Summer",
    image: "th_021.png",
    rating: 4.3,
    price: 2.99,
    vendor: "DietFood",
    wishList: true,
  ),
];

class Featured extends StatelessWidget {
  const Featured({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 220,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productsList.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    changeScreen(
                        _,
                        Details(
                            products: productsList[index],
                            name: nameList[index],
                            img: imgList[index]));
                  },
                  child: Container(
                    height: 200,
                    width: 180,
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: red.shade50,
                          offset: const Offset(15, 5),
                          blurRadius: 4)
                    ]),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          "images/${productsList[index].image}",
                          height: 140,
                          width: 140,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CustomText(
                                text: productsList[index].name,
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: grey.shade300,
                                          offset: const Offset(1, 1),
                                          blurRadius: 4)
                                    ]),
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: productsList[index].wishList
                                        ? const Icon(
                                            Icons.favorite,
                                            color: red,
                                            size: 12,
                                          )
                                        : const Icon(
                                            Icons.favorite_border,
                                            color: red,
                                            size: 12,
                                          )),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: CustomText(
                                    text: productsList[index].rating.toString(),
                                    color: grey,
                                    size: 14,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: red,
                                  size: 12,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: red,
                                  size: 12,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: red,
                                  size: 12,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: red,
                                  size: 12,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: grey,
                                  size: 12,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CustomText(
                                text: "\$${productsList[index].price}",
                                weight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
