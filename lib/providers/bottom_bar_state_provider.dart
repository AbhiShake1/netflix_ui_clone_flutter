import 'package:hooks_riverpod/hooks_riverpod.dart';

class _BottomBarStateProvider extends StateNotifier<int> {
  _BottomBarStateProvider() : super(0);

  set index(int val) => state = val;
}

final bottomBarStateRef = StateNotifierProvider<_BottomBarStateProvider, int>(
    (_) => _BottomBarStateProvider());
