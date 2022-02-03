import 'package:flutter/material.dart';
import 'package:netflix_ui_clone_flutter/data/data.dart';
import 'package:netflix_ui_clone_flutter/widgets/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _scrollOffset = 0;
    final _scrollController = useScrollController();
    useEffect(() {
      _scrollController
          .addListener(() => _scrollOffset = _scrollController.offset);
      return _scrollController.dispose;
    }, [_scrollController]);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth, 50),
        child: MyAppBar(
          scrollOffset: _scrollOffset,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: ContentHeader(
              featuredContent: sintelContent,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Previews(
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'Netflix Originals',
              contentList: originals,
              isOriginals: true,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(bottom: 20),
            sliver: SliverToBoxAdapter(
              child: ContentList(
                title: 'Trending',
                contentList: trending,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => 'Cast',
      ),
    );
  }
}
