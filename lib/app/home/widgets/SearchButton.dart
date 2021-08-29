import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:spotify_dl_web/app/home/widgets/viewmodels/SearchBarViewModel.dart';
import 'package:spotify_dl_web/app/home/widgets/viewmodels/SearchButtonViewModel.dart';
import 'package:spotify_dl_web/constants/AppColors.dart';
import 'package:spotify_dl_web/constants/LocalAssets.dart';

class SearchButton extends StatefulWidget {
  final double height;
  final double width;
  const SearchButton({required this.width, required this.height, Key? key})
      : super(key: key);

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: () async {
          await context.read(searchButtonProvider.notifier).submitData();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
        ),
        child: OverflowBox(
          maxWidth: 500,
          maxHeight: 500,
          child: Consumer(
              child: ClipRect(
                clipper: SubmitButtonClipper(),
                child: Lottie.asset(LocalAssets.proceedButton,
                    fit: BoxFit.fill,
                    width: 180,
                    height: 180,
                    controller: _animationController, onLoaded: (composition) {
                  _animationController.duration = composition.duration;
                }),
              ),
              builder: (context, watch, child) {
                final watchSearchButton = watch(searchButtonProvider);
                if (watchSearchButton) {
                  _animationController.forward();
                } else {
                  _animationController.reset();
                }

                return child!;
              }),
        ),
      ),
    );
  }
}

class SubmitButtonClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final rect = Offset(30, 40) & Size(110, 80);
    return rect;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return oldClipper != this;
  }
}
