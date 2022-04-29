import 'package:flutter/material.dart';
import 'package:food_app/trial.dart/data.dart';
import 'package:food_app/trial.dart/single_cat.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 4 / 3,
        ),
        children: DUMMY_CATEGORIES
            .map((item) => SingleCategory(item.id, item.title, item.color))
            .toList(),
      ),
    );
  }
}
