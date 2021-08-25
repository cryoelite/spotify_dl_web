import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/localization/locale_keys.g.dart';
import 'package:spotify_dl_web/services/ScreenConstraintService.dart';
import 'package:easy_localization/easy_localization.dart';

class MobileLayoutWidget extends ConsumerWidget {
  const MobileLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      width: 480,
      height: 720,
      alignment: Alignment.center,
      child: Text(
        LocaleKeys.Spotify_Music_Downloader,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 48,
            ),
      ).tr(),
    );
  }
}
