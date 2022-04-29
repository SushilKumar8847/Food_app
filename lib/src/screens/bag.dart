import 'package:flutter/material.dart';
import 'package:food_app/src/helpers/style.dart';
import 'package:food_app/src/models/products.dart';
import 'package:food_app/src/widgets/custom_text.dart';

class ShoppingBag extends StatefulWidget {
  const ShoppingBag({Key? key}) : super(key: key);

  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
  Product product = Product(
      name: "Cereals",
      image: "th_016.png",
      rating: 4.2,
      price: 5.99,
      vendor: "GoodFood",
      wishList: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: const CustomText(
          text: "Food Cart",
          size: 25,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 30,
                    )),
                Positioned(
                  top: 30,
                  right: 9,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.cyan.shade100,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: CustomText(
                        text: "2",
                        color: black,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 180,
              // width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                    color: red.shade100,
                    offset: const Offset(1, 2),
                    blurRadius: 8)
              ]),
              child: Row(
                children: [
                  Image.asset(
                    "images/${product.image}",
                    height: 200,
                    width: 200,
                    scale: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: product.name + "\n",
                              style: const TextStyle(
                                  color: black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: "\$" + product.price.toString() + "\n",
                              style: const TextStyle(
                                color: black,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              )),
                        ]),
                      ),
                      const SizedBox(
                        width: 75,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_forever_outlined))
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
