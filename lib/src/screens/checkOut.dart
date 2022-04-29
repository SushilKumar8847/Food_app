import 'package:flutter/material.dart';
import 'package:food_app/src/screens/home.dart';
import 'package:hive_flutter/adapters.dart';

import '../helpers/style.dart';
import '../widgets/helper.dart';
import 'changeAddress.dart';

class CheckoutScreen extends StatelessWidget {
  final _signBox = Hive.box('SignUp');

  CheckoutScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        "Checkout",
                        style: Helper.getTheme(context).headline5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Delivery Address"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Helper.getScreenWidth(context) * 0.4,
                        child: Text(
                          _signBox.get("Address"),
                          style: Helper.getTheme(context).headline3,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ChangeAddressScreen.routeName);
                        },
                        child: const Text(
                          "Change",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Payment method"),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              isScrollControlled: true,
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return SizedBox(
                                  height: Helper.getScreenHeight(context) * 0.7,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(
                                              Icons.clear,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Add Credit/Debit Card",
                                              style: Helper.getTheme(context)
                                                  .headline3,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Divider(
                                          color: AppColor.placeholder
                                              .withOpacity(0.5),
                                          thickness: 1.5,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const ShapeDecoration(
                                            color: AppColor.placeholderBg,
                                            shape: StadiumBorder(),
                                          ),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Card Number",
                                              hintStyle: TextStyle(
                                                color: AppColor.placeholder,
                                              ),
                                              // contentPadding: _padding,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Expiry"),
                                            SizedBox(
                                              height: 50,
                                              width: 100,
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: AppColor.placeholderBg,
                                                  shape: StadiumBorder(),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "MM",
                                                    hintStyle: TextStyle(
                                                      color:
                                                          AppColor.placeholder,
                                                    ),
                                                    // contentPadding: _padding,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 100,
                                              child: Container(
                                                width: double.infinity,
                                                height: 50,
                                                decoration:
                                                    const ShapeDecoration(
                                                  color: AppColor.placeholderBg,
                                                  shape: StadiumBorder(),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "YY",
                                                    hintStyle: TextStyle(
                                                      color:
                                                          AppColor.placeholder,
                                                    ),
                                                    // contentPadding: _padding,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const ShapeDecoration(
                                            color: AppColor.placeholderBg,
                                            shape: StadiumBorder(),
                                          ),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Security code",
                                              hintStyle: TextStyle(
                                                color: AppColor.placeholder,
                                              ),
                                              // contentPadding: _padding,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const ShapeDecoration(
                                            color: AppColor.placeholderBg,
                                            shape: StadiumBorder(),
                                          ),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "First Name",
                                              hintStyle: TextStyle(
                                                color: AppColor.placeholder,
                                              ),
                                              // contentPadding: _padding,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 50,
                                          decoration: const ShapeDecoration(
                                            color: AppColor.placeholderBg,
                                            shape: StadiumBorder(),
                                          ),
                                          child: const TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Last Name",
                                              hintStyle: TextStyle(
                                                color: AppColor.placeholder,
                                              ),
                                              // contentPadding: _padding,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: Helper.getScreenWidth(
                                                      context) *
                                                  0.4,
                                              child: const Text(
                                                  "You can remove this card at anytime"),
                                            ),
                                            Switch(
                                              value: false,
                                              onChanged: (_) {},
                                              thumbColor:
                                                  MaterialStateProperty.all(
                                                AppColor.secondary,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: SizedBox(
                                          height: 50,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                    Icons.add,
                                                  ),
                                                  SizedBox(width: 40),
                                                  Text("Add Card"),
                                                  SizedBox(width: 40),
                                                ],
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.add),
                            const Text(
                              "Add Card",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PaymentCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Cash on delivery"),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: const ShapeDecoration(
                          shape: const CircleBorder(
                            side: const BorderSide(color: AppColor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Image.asset(
                              "images/visa2.png",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("**** **** **** 5246"),
                        ],
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: AppColor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PaymentCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 30,
                            child: Image.asset(
                              "images/paypal.png",
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(_signBox.get("Email")),
                        ],
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: AppColor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Sub Total"),
                          Text(
                            "₹68",
                            style: Helper.getTheme(context).headline4,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Delivery Cost"),
                          Text(
                            "₹2",
                            style: Helper.getTheme(context).headline4,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Discount"),
                          Text(
                            "-₹4",
                            style: Helper.getTheme(context).headline4,
                          )
                        ],
                      ),
                      Divider(
                        height: 40,
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total"),
                          Text(
                            "₹66",
                            style: Helper.getTheme(context).headline4,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: Helper.getScreenHeight(context) * 0.7,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(Icons.clear),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      "images/vector4.png",
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Thank You!",
                                      style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "for your order",
                                      style: Helper.getTheme(context)
                                          .headline4
                                          ?.copyWith(color: AppColor.primary),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Text(
                                          "Your order is now being processed. We will let you know once the order is picked from the outlet. Check the status of your order"),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: SizedBox(
                                        height: 35,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: const Text("Track My Order"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home()));
                                        },
                                        child: const Text(
                                          "Back To Home",
                                          style: const TextStyle(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: const Text("Send Order"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    required Widget widget,
  })  : _widget = widget,
        super(key: key);

  final Widget _widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 30,
            right: 20,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: AppColor.placeholder.withOpacity(0.25),
              ),
            ),
            color: AppColor.placeholderBg,
          ),
          child: _widget),
    );
  }
}
