import 'package:hooks_riverpod/hooks_riverpod.dart';

class _ScrollOffsetProvider extends StateNotifier<double> {
  _ScrollOffsetProvider() : super(0);

  set scrollOffset(double val) => state = val;
}

final scrollOffsetRef = StateNotifierProvider<_ScrollOffsetProvider, double>(
  (_) => _ScrollOffsetProvider(),
);
