import 'package:flutter/material.dart';
import 'package:spotify_dl_web/app/home/widgets/SearchButton.dart';
import 'package:spotify_dl_web/app/home/widgets/viewmodels/SearchBarViewModel.dart';
import 'package:spotify_dl_web/app/home/widgets/viewmodels/SearchButtonViewModel.dart';
import 'package:spotify_dl_web/constants/AppColors.dart';
import 'package:spotify_dl_web/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerWidget {
  final double width;
  final double height;
  SearchBar({required this.width, required this.height, Key? key})
      : super(key: key);

  Future<void> _onsubmitted(BuildContext context) async {
    await context.read(searchButtonProvider.notifier).submitData();
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final watchSearchBar = watch(searchBarProvider);
    return Container(
      width: width,
      height: height * 0.65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: AppColors.colorWhite,
        boxShadow: [
          BoxShadow(
            offset: Offset(
              3,
              5,
            ),
            color: AppColors.colorDarkGrey,
            blurRadius: 12,
            spreadRadius: -8,
          ),
        ],
      ),
      child: TextField(
        controller: watchSearchBar,
        autocorrect: false,
        maxLength: 2100,
        cursorColor: AppColors.colorPink,
        cursorWidth: 1,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 25),
        keyboardType: TextInputType.url,
        onEditingComplete: () async => await _onsubmitted(context),
        onSubmitted: (_) async => await _onsubmitted(context),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: SearchButton(
              width: 95,
              height: 50,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: LocaleKeys.Enter_URL.tr(),
          hintStyle: Theme.of(context).textTheme.button?.copyWith(
                fontSize: 25,
              ),
          contentPadding: EdgeInsets.only(
            left: width * 0.02,
            right: width * 0.02,
            top: 25,
          ),
          counter: Container(
            width: 1,
            height: 1,
          ),
        ),
      ),
    );
  }
}
