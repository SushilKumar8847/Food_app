import 'package:flutter/material.dart';
import 'package:food_app/src/models/category.dart';

import '../helpers/style.dart';
import 'custom_text.dart';

List<Category> categoriesList = [
  Category(name: "Salad", image: "th_002.png"),
  Category(name: "Desert", image: "th_003.png"),
  Category(name: "Italian", image: "th_005.png"),
  Category(name: "Chinese", image: "th_010.png"),
  Category(name: "South Indian", image: "th_011.png"),
  Category(name: "North Indian", image: "th_022.png"),
];

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: red.shade50,
                          offset: const Offset(9, 6),
                          blurRadius: 15)
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        "images/${categoriesList[index].image}",
                        width: 80,
                      ),
                    )),
                const SizedBox(
                  height: 3,
                ),
                CustomText(
                  text: categoriesList[index].name,
                  size: 14,
                  color: black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
