import 'package:flutter/material.dart';
import 'package:netflix_ui_clone_flutter/assets.dart';
import 'package:netflix_ui_clone_flutter/extensions.dart';
import 'package:velocity_x/velocity_x.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.scrollOffset = 0}) : super(key: key);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: !context.isDesktop ? const _MyAppBarMobile() : const _MyAppBarDesktop(),
    );
  }
}

class _MyAppBarMobile extends StatelessWidget {
  const _MyAppBarMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

class _MyAppBarDesktop extends StatelessWidget {
  const _MyAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          12.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _AppBarButton(
                title: 'Home',
                onTap: () => 'Home',
              ),
              _AppBarButton(
                title: 'TV Shows',
                onTap: () => 'TV Shows',
              ),
              _AppBarButton(
                title: 'Movies',
                onTap: () => 'Movies',
              ),
              _AppBarButton(
                title: 'Latest',
                onTap: () => 'Latest',
              ),
              _AppBarButton(
                title: 'My List',
                onTap: () => 'My List',
              ),
            ],
          ).expand(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.search),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('Search'),
              ),
              _AppBarButton(
                title: 'Kids',
                onTap: () => 'Kids',
              ),
              _AppBarButton(
                title: 'DVD',
                onTap: () => 'DVD',
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.card_giftcard),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('Gift'),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.notifications),
                iconSize: 28,
                color: Colors.white,
                onPressed: () => print('Notifications'),
              ),
            ],
          ).expand()
        ],
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
