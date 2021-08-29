import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/app/home/widgets/viewmodels/SongViewModel.dart';
import 'package:spotify_dl_web/constants/AppColors.dart';

class SimpleDownloadBox extends ConsumerWidget {
  final double width;
  final double height;
  const SimpleDownloadBox({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final watchSongModel = watch(songModelProvider);
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: height,
              width: width * 0.8,
              decoration: BoxDecoration(
                color: AppColors.colorWhite,
                borderRadius: BorderRadius.circular(
                  20,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(
                      15,
                      15,
                    ),
                    color: AppColors.colorDarkGrey,
                    blurRadius: 20,
                    spreadRadius: -15,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(
              -1,
              -0.5,
            ),
            child: Container(
              width: width * 0.75,
              height: height * 0.5,
              decoration: BoxDecoration(
                color: AppColors.colorDarkGrey,
                borderRadius: BorderRadius.circular(
                  20,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(
                      20,
                      20,
                    ),
                    color: AppColors.colorDarkGrey,
                    blurRadius: 20,
                    spreadRadius: -14,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  watchSongModel.imageURL,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, 0.45),
            child: Container(
              width: width * 0.75,
              height: height * 0.1,
              alignment: Alignment.center,
              child: Text(
                watchSongModel.songName,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: height * 0.05,
                    ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-1, 0.67),
            child: Container(
              width: width * 0.75,
              height: height * 0.1,
              alignment: Alignment.center,
              child: Text(
                watchSongModel.artistName,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: height * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.8, 0.5),
            child: Container(
              width: width * 0.75,
              height: height * 0.1,
              alignment: Alignment.center,
              child: Text(
                watchSongModel.artistName,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: height * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
