import 'package:flutter/material.dart';

import '../helpers/style.dart';
import '../widgets/helper.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = "/paymentScreen";

  const PaymentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Payment Details",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      // Image.asset(
                      //   "images/cart.png",
                      // )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Payment method",
                        style: Helper.getTheme(context).headline4,
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                    height: 30,
                  ),
                ),
                Container(
                  height: 170,
                  width: Helper.getScreenWidth(context),
                  decoration: BoxDecoration(
                    color: AppColor.placeholderBg,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.placeholder.withOpacity(0.5),
                        offset: const Offset(0, 20),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Cash/Card on delivery",
                              style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.check,
                              color: AppColor.orange,
                            )
                          ],
                        ),
                        const Divider(
                          color: AppColor.placeholder,
                          thickness: 1,
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              child: Image.asset(
                                "images/visa.png",
                              ),
                            ),
                            const Text("**** **** ****"),
                            const Text("2187"),
                            OutlinedButton(
                              style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    const BorderSide(
                                      color: AppColor.orange,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                    const StadiumBorder(),
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                      AppColor.orange)),
                              onPressed: () {},
                              child: const Text("Delete Card"),
                            )
                          ],
                        ),
                        const Divider(
                          color: AppColor.placeholder,
                          thickness: 1,
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Text(
                              "Other Methods",
                              style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  height: 50,
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
                                                .headline4,
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
                                            contentPadding:
                                                EdgeInsets.only(left: 30),
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
                                              decoration: const ShapeDecoration(
                                                color: AppColor.placeholderBg,
                                                shape: StadiumBorder(),
                                              ),
                                              child: const TextField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "MM",
                                                  hintStyle: TextStyle(
                                                    color: AppColor.placeholder,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 30),
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
                                              decoration: const ShapeDecoration(
                                                color: AppColor.placeholderBg,
                                                shape: StadiumBorder(),
                                              ),
                                              child: const TextField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "YY",
                                                  hintStyle: TextStyle(
                                                    color: AppColor.placeholder,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 30),
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
                                            contentPadding:
                                                EdgeInsets.only(left: 30),
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
                                            contentPadding:
                                                EdgeInsets.only(left: 30),
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
                                            contentPadding:
                                                EdgeInsets.only(left: 30),
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
                                          const Text(
                                              "You can remove this card"),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add),
                          Text("Add Another Credit/Debit Card"),
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
