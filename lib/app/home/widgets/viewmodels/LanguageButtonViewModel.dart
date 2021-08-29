import 'package:flutter/material.dart' show ValueNotifier, Locale;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageButtonDropdownProvider =
    ChangeNotifierProvider<ValueNotifier<Locale?>>((_) => ValueNotifier(null));
