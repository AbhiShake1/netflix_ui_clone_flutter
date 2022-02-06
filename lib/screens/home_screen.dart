import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netflix_ui_clone_flutter/data/data.dart';
import 'package:netflix_ui_clone_flutter/providers/scroll_offset_provider.dart';
import 'package:netflix_ui_clone_flutter/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth, 50),
        child: HookConsumer(
          builder: (context, ref, child) => MyAppBar(
            scrollOffset: ref.watch(scrollOffsetRef),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController
          ..addListener(() => ProviderScope.containerOf(context)
              .read(scrollOffsetRef.notifier)
              .scrollOffset = scrollController.offset),
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
        onPressed: () => print('Cast'),
      ),
    );
  }
}
