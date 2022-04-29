import 'package:flutter/material.dart';
import '../helpers/style.dart';
import '../widgets/helper.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "/aboutScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
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
                          "About Us",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      // Image.asset(
                      //   Helper.getAssetName("cart.png", "virtual"),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: const [
                      AboutCard(),
                      SizedBox(
                        height: 20,
                      ),
                      AboutCard(),
                      SizedBox(
                        height: 20,
                      ),
                      AboutCard(),
                    ],
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

class AboutCard extends StatelessWidget {
  const AboutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CircleAvatar(
          radius: 5,
          backgroundColor: AppColor.orange,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            "Bhai bola kuch mat likho , isliye mai kuch nahi likh raha hu.",
            style: TextStyle(
              color: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}
