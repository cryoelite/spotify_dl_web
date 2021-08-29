import 'package:flutter/material.dart';
import 'package:spotify_dl_web/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class MainTitleWidget extends StatelessWidget {
  final double height;
  final double width;
  const MainTitleWidget({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: Text(
        LocaleKeys.Spotify_Music_Downloader,
        style: Theme.of(context).textTheme.headline3?.copyWith(
              fontSize: width * 0.058,
            ),
      ).tr(),
    );
  }
}
