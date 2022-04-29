import 'package:flutter/material.dart';
import 'package:food_app/src/screens/payment.dart';

import '../helpers/style.dart';
import '../widgets/helper.dart';
import 'aboutscreen.dart';
import 'inbox.dart';
import 'order.dart';

class MoreScreen extends StatelessWidget {
  static const routeName = "/moreScreen";

  const MoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "More",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      // Image.asset(
                      //   Helper.getAssetName("cart.png", "virtual"),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaymentScreen()));
                    },
                    child: MoreCard(
                      image: Image.asset(
                        "images/income.png",
                      ),
                      name: "Payment Details",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyOrderScreen()));
                    },
                    child: MoreCard(
                      image: Image.asset(
                        "images/shopping_bag.png",
                      ),
                      name: "My Orders",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InboxScreen()));
                    },
                    child: MoreCard(
                      image: Image.asset(
                        "images/mail.png",
                      ),
                      name: "Inbox",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()));
                      },
                      child: MoreCard(
                        image: Image.asset(
                          "images/info.png",
                        ),
                        name: "About Us",
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MoreCard extends StatelessWidget {
  const MoreCard({
    Key? key,
    required String name,
    required Image image,
    // required Function() handler,
  })  : _name = name,
        _image = image,
        // _handler = handler,
        super(key: key);

  final String _name;
  final Image _image;
  // final Function() _handler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      // _handler;
      // },
      child: SizedBox(
        height: 70,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: const EdgeInsets.only(
                right: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: AppColor.placeholderBg,
              ),
              child: Row(
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(),
                        color: AppColor.placeholder,
                      ),
                      child: _image),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    _name,
                    style: const TextStyle(
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 30,
                width: 30,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColor.placeholderBg,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.secondary,
                  size: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
