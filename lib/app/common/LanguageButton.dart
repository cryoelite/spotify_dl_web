import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/app/InitializeApp/viewmodels/KeyStateViewModel.dart';
import 'package:spotify_dl_web/app/common/viewmodels/LanguageButtonViewModel.dart';
import 'package:spotify_dl_web/constants/SupportedLocales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:spotify_dl_web/localization/locale_keys.g.dart';

//TODO: Do something about this popupmenubutton
class LanguageButton extends StatelessWidget {
  final double height;
  final double width;
  const LanguageButton({required this.height, required this.width, Key? key})
      : super(key: key);

  List<PopupMenuItem<Locale>> _generateList(BuildContext context) {
    final List<PopupMenuItem<Locale>> itemList = [];
    for (final locale in SupportedLocales.allLocales) {
      final item = PopupMenuItem(
        child: Text(
          locale.languageCode.toUpperCase(),
          style: Theme.of(context).textTheme.headline2?.copyWith(
                fontSize: 10,
              ),
        ),
        value: locale,
        height: 12,
        padding: EdgeInsets.only(left: 10),
      );

      itemList.add(item);
    }
    return itemList;
  }

  Future<void> _onTap(Locale value, BuildContext context) async {
    if (context.locale != value) {
      await context.setLocale(value);
    }
    context.read(languageButtonDropdownProvider).value = value;
    context.read(keyStateProvider.notifier).changeKey();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.centerRight,
      child: PopupMenuButton(
        itemBuilder: _generateList,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Text(
              context.locale.languageCode.toUpperCase(),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontSize: 10,
                  ),
            ),
            Icon(
              Icons.arrow_drop_down_sharp,
              size: 13,
            ),
          ],
        ),
        onSelected: (Locale val) => _onTap(val, context),
        tooltip: LocaleKeys.Language.tr(),
      ),
    );
  }
}


/* DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          height: 10,
          minWidth: 10,
          child: DropdownButton<Locale>(
            items: _generateList(context),
            onChanged: (val) async => await _onTap(val, context),
            hint: Text(
              context.locale.languageCode.toUpperCase(),
              style: Theme.of(context).textTheme.headline2?.copyWith(
                    fontSize: 10,
                  ),
            ),
            value: watchLanguageProvider.value,
            icon: Icon(
              Icons.arrow_drop_down_sharp,
              size: 13,
            ),
            isDense: true,
            itemHeight: null,
          ),
        ),
      ), */