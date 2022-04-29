import 'package:flutter/material.dart';

import 'custom_text.dart';

class ButtomNavIcon extends StatelessWidget {
  final IconData iconss;
  final String name;
  final onTap;
  const ButtomNavIcon(
      {Key? key, required this.iconss, required this.name, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(iconss),
            SizedBox(
              height: 7,
            ),
            CustomText(text: name)
          ],
        ),
      ),
    );
  }
}
