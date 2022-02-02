import 'package:flutter/material.dart';
import 'package:netflix_ui_clone_flutter/models/content_model.dart';
import 'package:velocity_x/velocity_x.dart';

class Previews extends StatelessWidget {
  final String title;
  final List<Content> contentList;

  const Previews({
    Key? key,
    required this.title,
    required this.contentList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title.text.white.size(20).bold.make().px(24),
        SizedBox(
          height: 165,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
            itemCount: contentList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(content.imageUrl),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: content.color ?? Colors.white, width: 4)),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            Colors.transparent
                          ],
                          stops: [0, .25, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: content.color ?? Colors.white, width: 4),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        height: 60,
                        child: Image.asset(content.titleImageUrl!),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
