import 'package:flutter/foundation.dart' show kIsWeb;

/// Assets folder is accessed differently based on platform, this service should be used
/// to get the right asset per device.
class DeviceBasedAssets {
  String getConvertedAsset(String asset) {
    if (kIsWeb) {
      return asset;
    } else {
      return 'assets/' + asset;
    }
  }
}
