import 'package:hooks_riverpod/hooks_riverpod.dart';

class _VideoMutedProvider extends StateNotifier<bool> {
  _VideoMutedProvider() : super(true);

  set isMuted(bool val) => state = val;

  bool get isMuted => state;
}

final videoMutedRef = StateNotifierProvider<_VideoMutedProvider, bool>(
  (_) => _VideoMutedProvider(),
);
