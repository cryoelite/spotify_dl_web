class ScreenConstraintModel {
  ///This is the maximum screen width
  final double maxWidth;

  ///This is the maximum screen Height
  final double maxHeight;

  final double size;

  ScreenConstraintModel(this.size, this.maxWidth, this.maxHeight);

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
}
