import 'package:flutter/material.dart';
import 'package:netflix_ui_clone_flutter/widgets/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _scrollOffset = 0;
    final _scrollController = useScrollController();
    useEffect(() {
      _scrollController
          .addListener(() => _scrollOffset = _scrollController.offset);
      return () => _scrollController.dispose();
    }, [_scrollController]);

    return Scaffold(
      appBar: MyAppBar(
        scrollOffset: _scrollOffset,
      ) as PreferredSize,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
              color: Colors.blue,
            ),
          )
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
