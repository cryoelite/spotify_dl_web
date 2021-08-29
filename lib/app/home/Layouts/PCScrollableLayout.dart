import 'package:flutter/material.dart';
import 'package:spotify_dl_web/app/home/widgets/MainTitleWidget.dart';
import 'package:spotify_dl_web/app/home/widgets/SearchBar.dart';
import 'package:spotify_dl_web/app/home/widgets/TopBar.dart';
import 'package:spotify_dl_web/constants/LocalAssets.dart';
import 'package:spotify_dl_web/services/DeviceBasedAssets.dart';

class PCScrollableLayout extends StatelessWidget {
  final double width;
  final double height;
  const PCScrollableLayout(
      {required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
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
      child: SingleChildScrollView(
        child: Container(
          width: width,
          height: height * 4,
          child: Column(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: TopBar(
                    width: 1070,
                    height: height * 0.1,
                  ),
                ),
              ),
              Flexible(
                flex: 9,
                child: Container(
                  width: 700,
                  height: 300,
                  child: Column(
                    children: [
                      MainTitleWidget(
                        width: 700,
                        height: 80,
                      ),
                      Container(
                        height: 80,
                        width: 1,
                      ),
                      SearchBar(
                        width: 700,
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
