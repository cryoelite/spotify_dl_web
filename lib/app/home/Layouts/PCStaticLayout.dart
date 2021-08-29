import 'package:flutter/material.dart';
import 'package:spotify_dl_web/app/home/widgets/MainTitleWidget.dart';
import 'package:spotify_dl_web/app/home/widgets/SearchBar.dart';
import 'package:spotify_dl_web/app/home/widgets/SimpleDownloadBox.dart';
import 'package:spotify_dl_web/app/home/widgets/TopBar.dart';
import 'package:spotify_dl_web/constants/LocalAssets.dart';
import 'package:spotify_dl_web/services/DeviceBasedAssets.dart';

class PCStaticLayout extends StatelessWidget {
  final double width;
  final double height;
  const PCStaticLayout({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(350 / height);
    return Container(
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
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: TopBar(
              width: 1070,
              height: 50,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.66),
            child: MainTitleWidget(
              width: 700,
              height: 80,
            ),
          ),
          Align(
            alignment: Alignment(0, -0.4),
            child: SearchBar(
              width: width * 0.36,
              height: 80,
            ),
          ),
          Align(
            alignment: Alignment(-0.5, 0.4),
            child: SimpleDownloadBox(
              width: width * 0.235,
              height: height * 0.35,
            ),
          ),
          Align(
            alignment: Alignment(0.5, 0.4),
            child: Container(
              width: width * 0.18,
              height: height * 0.35,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
