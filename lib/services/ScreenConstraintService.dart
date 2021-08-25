/* import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenConstraintProvider = Provider((_) => ScreenConstraintService());

///Screen Configuration Service, provides custom constraints.
class ScreenConstraintService {
  double _minWidth = 0;

  ///This is the maximum screen width
  double maxWidth = 0;

  double _minHeight = 0;

  ///This is the maximum screen Height
  double maxHeight = 0;

  double size = 0;

  ///Prototype's max width. Prototype dimensions are taken from the XD file.
  final double protoMaxWidth = 375;

  ///Prototype's max height. Prototype dimensions are taken from the XD file.
  final double protoMaxHeight = 812;

  double getConvertedHeight(double protoHeight) {
    final double convertedNormalHeight =
        (protoHeight * maxHeight) / protoMaxHeight;
    return convertedNormalHeight;
  }

  double getConvertedWidth(double protoWidth) {
    final double convertedNormalWidth = (protoWidth * maxWidth) / protoMaxWidth;
    return convertedNormalWidth;
  }

  double getConvertedX(double protoWidth) {
    final double convertedNormalWidth = (protoWidth * maxWidth) / protoMaxWidth;
    return protoMaxWidth - convertedNormalWidth;
  }

  double getConvertedY(double protoHeight) {
    final double convertedNormalHeight =
        (protoHeight * maxHeight) / protoMaxHeight;
    return protoMaxHeight - convertedNormalHeight;
  }

  void init(BuildContext context,
      {required double aspectRatioHeight, required double aspectRatioWidth}) {
    final mSize = MediaQuery.of(context).size;
    maxWidth = mSize.width;
    maxHeight = mSize.height;
    _minHeight = maxHeight / aspectRatioHeight;
    _minWidth = maxWidth / aspectRatioWidth;
    size = _minHeight / aspectRatioHeight * _minWidth / aspectRatioWidth;
  }
}
 */