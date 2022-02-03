import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui_clone_flutter/models/content_model.dart';
import 'package:velocity_x/velocity_x.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOriginals;

  const ContentList(
      {Key? key,
      required this.title,
      required this.contentList,
      this.isOriginals = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.white.size(20).bold.make().px(24),
        SizedBox(
          height: isOriginals ? 500 : 220,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            itemBuilder: (context, index) {
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  height: isOriginals ? 400 : 200,
                  width: isOriginals ? 200 : 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(content.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ).pSymmetric(v: 6);
  }
}
