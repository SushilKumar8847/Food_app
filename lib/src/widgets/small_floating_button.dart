import 'package:flutter/material.dart';

import '../helpers/style.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;
  const SmallButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              size: 20,
              color: white,
            ),
          ),
        ));
  }
}
