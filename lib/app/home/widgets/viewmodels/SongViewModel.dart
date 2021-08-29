import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotify_dl_web/constants/LocalAssets.dart';
import 'package:spotify_dl_web/models/SongModel.dart';
import 'package:spotify_dl_web/services/DeviceBasedAssets.dart';

final songModelProvider = StateNotifierProvider<SongViewModel, SongModel>((_) {
  return SongViewModel(
    SongModel(
      "https://www.youtube.com/watch?v=7PL7ADKDYcw",
      DeviceBasedAssets().getConvertedAsset(LocalAssets.sampleAlbumIcon),
      "Marshmallow",
      "Lukrembo",
    ),
  );
});

//TODO: ADD backend so that image URL can be fetched from external sources. Currently getting an offline image and showing it.
class SongViewModel extends StateNotifier<SongModel> {
  SongViewModel(SongModel songModel) : super(songModel);

  Future<void> playSong() async{
    
  }
}
