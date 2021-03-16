import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3411904415016518~7101978329";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3411904415016518~8105096472";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3411904415016518/1822759150";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3411904415016518/6600443111";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
