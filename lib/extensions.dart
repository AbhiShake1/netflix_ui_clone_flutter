import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

extension ContextX on BuildContext {
  bool get isDesktop => screenWidth >= 1200;
}
