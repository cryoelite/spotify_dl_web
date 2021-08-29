import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchBarProvider =
    StateNotifierProvider<SearchBarViewModel, TextEditingController>(
        (_) => SearchBarViewModel());

class SearchBarViewModel extends StateNotifier<TextEditingController> {
  SearchBarViewModel() : super(TextEditingController());
}
