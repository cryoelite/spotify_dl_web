/* import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/models/ScreenConstrainModel.dart';

///Screen Configuration Service, provides custom constraints.

final screenConstraintProvider =
    StateNotifierProvider<ScreenConstraintClass, ScreenConstraintModel>(
  (_) => ScreenConstraintClass(
    ScreenConstraintModel(
      79,
      1080,
      1920,
    ),
  ),
);

class ScreenConstraintClass extends StateNotifier<ScreenConstraintModel> {
  ScreenConstraintClass(ScreenConstraintModel _screenConstraintModel)
      : super(_screenConstraintModel);
  void init(
      {required double aspectRatioHeight,
      required double aspectRatioWidth,
      required double maxHeight,
      required double maxWidth}) {
    final double minWidth = maxWidth / aspectRatioWidth;
    final double minHeight = maxHeight / aspectRatioHeight;
    final size = minHeight / aspectRatioHeight * minWidth / aspectRatioWidth;
    state = ScreenConstraintModel(size, maxWidth, maxHeight);
  }
}
 */