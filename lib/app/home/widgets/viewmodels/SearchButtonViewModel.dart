import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/app/home/widgets/viewmodels/SearchBarViewModel.dart';

final searchButtonProvider =
    StateNotifierProvider<SearchButtonViewModel, bool>((ref) {
  return SearchButtonViewModel(ref);
});

class SearchButtonViewModel extends StateNotifier<bool> {
  final ProviderReference _ref;
  SearchButtonViewModel(this._ref) : super(false);

  Future<void> submitData() async {
    state = true;
    final value = _ref.read(searchBarProvider).value.text;
    await Future.delayed(Duration(seconds: 5));
    state = false;
    _ref.read(searchBarProvider).clear();
  }

  bool get currentState => state;
}
