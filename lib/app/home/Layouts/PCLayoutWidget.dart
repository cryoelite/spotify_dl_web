import 'package:flutter/material.dart';
import 'package:spotify_dl_web/app/home/Layouts/PCScrollableLayout.dart';
import 'package:spotify_dl_web/app/home/Layouts/PCStaticLayout.dart';

class PCLayoutWidget extends StatelessWidget {
  final double width;
  final double height;
  const PCLayoutWidget({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (height <= 600) {
      return PCScrollableLayout(
        width: width,
        height: height,
      );
    } else {
      return PCStaticLayout(
        width: width,
        height: height,
      );
    }
  }
}
