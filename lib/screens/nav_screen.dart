import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:netflix_ui_clone_flutter/providers/bottom_bar_state_provider.dart';
import 'package:netflix_ui_clone_flutter/screens/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class NavScreen extends ConsumerWidget {
  const NavScreen({Key? key}) : super(key: key);

  final _screens = const [
    //maintain current scroll position without generated routes
    HomeScreen(
      key: PageStorageKey('homeScreen'),
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'home': Icons.home,
    'search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'More': Icons.menu
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentIndex = ref.watch(bottomBarStateRef);
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 11,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        onTap: (i) => ref.read(bottomBarStateRef.notifier).index = i,
        items: _icons
            .map(
              (title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  title: title.text.make(),
                  icon: Icon(
                    icon,
                    size: 30,
                  ),
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
