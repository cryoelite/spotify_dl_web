import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/app/common/LanguageButton.dart';
import 'package:spotify_dl_web/constants/AppColors.dart';
import 'package:spotify_dl_web/constants/LocalAssets.dart';
import 'package:spotify_dl_web/constants/URLs.dart';
import 'package:spotify_dl_web/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:spotify_dl_web/services/DeviceBasedAssets.dart';
import 'package:url_launcher/url_launcher.dart';

class TopBar extends ConsumerWidget {
  final double width;
  final double height;
  const TopBar({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(
              0,
              5,
            ),
            color: AppColors.colorDarkGrey,
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
        color: AppColors.colorWhite,
      ),
      child: Stack(
        children: [
          Image.asset(
            DeviceBasedAssets().getConvertedAsset(LocalAssets.topIcon),
            width: 40,
            height: height,
            fit: BoxFit.scaleDown,
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              child: Text(
                LocaleKeys.Title.tr(),
                style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontSize: height * 0.4,
                    ),
              ),
              onPressed: () async {},
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.7, 0),
            child: TextButton(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.Github.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 10),
                  ),
                  Container(
                    height: height,
                    alignment: Alignment(0, -0.4),
                    child: Icon(
                      Icons.open_in_new,
                      color: AppColors.colorDarkGrey,
                      size: 6,
                    ),
                  ),
                ],
              ),
              onPressed: () async {
                dev.log("Navigating to github...", level: 800);
                if (await canLaunch(URLs.githubURL)) {
                  await launch(URLs.githubURL);
                }
              },
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all<Color>(
                  Colors.transparent,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: LanguageButton(
              height: height,
              width: 48,
            ),
          )
        ],
      ),
    );
  }
}
