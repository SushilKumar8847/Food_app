import 'package:flutter/material.dart';
import 'package:food_app/src/helpers/screen_navigation.dart';
import 'package:food_app/src/helpers/style.dart';
import 'package:food_app/src/screens/account.dart';
import 'package:food_app/src/screens/bag.dart';
import 'package:food_app/src/screens/deseert.dart';
import 'package:food_app/src/screens/menu.dart';
import 'package:food_app/src/screens/notification.dart';
import 'package:food_app/src/widgets/buttom_navigation_icon.dart';
import 'package:food_app/src/widgets/categories.dart';
import 'package:food_app/src/widgets/custom_text.dart';
import 'package:food_app/src/widgets/featured_products.dart';
import 'package:food_app/src/widgets/small_floating_button.dart';
import 'package:food_app/trial.dart/routes.dart';
import 'package:hive_flutter/adapters.dart';

import '../../trial.dart/routes1.dart';
import 'more.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _signBox = Hive.box('SignUp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Hello ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 18),
                          ),
                          Text(
                            _signBox.get('Name'),
                            style: const TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 25),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(bottom: 10)),
                      const CustomText(
                          text: "Search food you like to eat 🤤", size: 15),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen()));
                        },
                        icon: const Icon(Icons.notifications_none)),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(
                      color: grey.shade300,
                      offset: const Offset(1, 1),
                      blurRadius: 4)
                ]),
                child: const ListTile(
                  leading: Icon(Icons.search, color: red),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "Find a food and restaurent",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: red,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Categories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: "Featured",
                    size: 20,
                    color: black,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TabRoute()));
                      },
                      child: const Text("View All"))
                ],
              ),
            ),
            const Featured(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular",
                size: 20,
                color: black,
              ),
            ),
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("images/th_024.png")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallButton(Icons.favorite),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow[900],
                              size: 20,
                            ),
                            const Text("4.5")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "Pancake \n",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: white)),
                          TextSpan(
                              text: "by :",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: white)),
                          TextSpan(
                              text: " Pizza Hut",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: white))
                        ], style: TextStyle(color: black))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: "\$12.99 \n",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w300,
                                  color: white))
                        ], style: TextStyle(color: black))),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
            height: 70,
            color: white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const ButtomNavIcon(
                    name: "Home",
                    iconss: Icons.home,
                  ),
                  ButtomNavIcon(
                    onTap: () {
                      changeScreen(context, const MenuScreen());
                    },
                    name: "Menu",
                    iconss: Icons.menu,
                  ),
                  ButtomNavIcon(
                    onTap: () {
                      changeScreen(context, const ShoppingBag());
                    },
                    name: "Cart",
                    iconss: Icons.shopping_bag,
                  ),
                  ButtomNavIcon(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Account()));
                    },
                    name: "Profile",
                    iconss: Icons.person,
                  ),
                  ButtomNavIcon(
                    onTap: () {
                      changeScreen(context, const MoreScreen());
                    },
                    name: "More",
                    iconss: Icons.more,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8),
                  //   child: Column(
                  //     children: [
                  //       Icon(Icons.ac_unit),
                  //       // Image.asset(
                  //       //   "images/home.png",
                  //       //   width: 46,
                  //       //   height: 46,
                  //       // ),
                  //       SizedBox(
                  //         height: 7,
                  //       ),
                  //       CustomText(text: "Home")
                  //     ],
                  //   ),
                  // ),
                ])));
  }
}
