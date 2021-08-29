import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppInitializer extends StateNotifier<bool> {
  AppInitializer() : super(false);

  Future<void> init() async {}
}
