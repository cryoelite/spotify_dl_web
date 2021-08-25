import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/app/common/TopBar.dart';
import 'package:spotify_dl_web/constants/LocalAssets.dart';
import 'package:spotify_dl_web/services/DeviceBasedAssets.dart';

class PCLayoutWidget extends ConsumerWidget {
  const PCLayoutWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      width: 1080,
      height: 1920,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            DeviceBasedAssets().getConvertedAsset(
              LocalAssets.backgroundImage,
            ),
          ),
          alignment: Alignment.center,
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TopBar(
            width: 660,
            height: 30,
          ),
        ],
      ),
    );
  }
}
