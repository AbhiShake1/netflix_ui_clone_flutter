import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class VerticalIconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() onTap;
  const VerticalIconButton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          2.heightBox,
          title.text.white.fontWeight(FontWeight.w600).make()
        ],
      ),
    );
  }
}
