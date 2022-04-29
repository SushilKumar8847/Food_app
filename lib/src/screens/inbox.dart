import 'package:flutter/material.dart';
import '../helpers/style.dart';
import '../widgets/helper.dart';

class InboxScreen extends StatelessWidget {
  static const routeName = "/inboxScreen";
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
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios_rounded),
                      ),
                      Expanded(
                        child: Text(
                          "Inbox",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      Image.asset(
                        "images/cart.png",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const MailCard(
                  title: "Promocode",
                  description: "Use FLUTTER code and order Food ",
                  time: "6th june",
                ),
                const MailCard(
                  title: "Promocode",
                  description: "Use FLAT 50 and chill 😎",
                  time: "6th July",
                  color: AppColor.placeholderBg,
                ),
                const MailCard(
                  title: "Promocode",
                  description: "Use FLAT 90 ",
                  time: "6th August",
                ),
                const MailCard(
                  title: "Buy 2 get 1 free",
                  description: "By buying 2 item upto ₹350 get 1 item free 🤟",
                  time: "6th September",
                  color: AppColor.placeholderBg,
                ),
                const MailCard(
                  title: "Flat 50% off",
                  description: "By ordering item upto ₹400 get off FLAT 50%",
                  time: "6th October",
                ),
                const MailCard(
                  title: "Upto 50% off",
                  description: "Order food upto ₹350 and get off upto 50%",
                  time: "6th NOvember",
                ),
                const MailCard(
                  title: "Knock Knock ✊✊ ",
                  description: "We have some Weekend offer for you,"
                      "Order food and chill Weekend",
                  time: "6th NOvember",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MailCard extends StatelessWidget {
  const MailCard({
    Key? key,
    required String time,
    required String title,
    required String description,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _description = description,
        _color = color,
        super(key: key);

  final String _time;
  final String _title;
  final String _description;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: const Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: const TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(_description),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _time,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
              // Image.asset(
              //   "images/star.png",
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
