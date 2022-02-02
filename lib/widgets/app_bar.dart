import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:netflix_ui_clone_flutter/assets.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.scrollOffset = 0}) : super(key: key);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            12.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => 'TV Shows',
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => 'Movies',
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => 'My List',
                ),
              ],
            ).expand()
          ],
        ),
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;
  const _AppBarButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: title.text.white.size(16).fontWeight(FontWeight.w600).make(),
    );
  }
}
