import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

final keyStateProvider =
    StateNotifierProvider<KeyStateViewModel, Key>((_) => KeyStateViewModel());

class KeyStateViewModel extends StateNotifier<Key> {
  KeyStateViewModel() : super(UniqueKey());

  void changeKey() {
    state = UniqueKey();
  }

  Future<void> changeLocale(
      {required String locale, required BuildContext context}) async {
    await context.setLocale(Locale(locale));
    changeKey();
  }

  Key get currentLocale => state;
}
