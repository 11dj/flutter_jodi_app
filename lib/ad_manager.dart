import 'dart:io';

class AdManager {
  static String get appId {
    String mode = 'prod';
    var ids = {
      "test": {
        "android": "ca-app-pub-3940256099942544~4354546703",
        "ios": "ca-app-pub-3940256099942544~2594085930"
      },
      "prod": {
        "android": "ca-app-pub-7496193969671704~8461628549",
        "ios": "ca-app-pub-7496193969671704~9898478070"
      },
    };
    if (Platform.isAndroid) {
      return ids[mode]['android'];
    } else if (Platform.isIOS) {
      return ids[mode]['ios'];
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    String mode = 'prod';
    var bannerIds = {
      "test": {
        "android": "ca-app-pub-3940256099942544/8865242552",
        "ios": "ca-app-pub-3940256099942544/4339318960"
      },
      "prod": {
        "android": "ca-app-pub-7496193969671704/2146026856",
        "ios": "ca-app-pub-7496193969671704/2478921546"
      },
    };
    if (Platform.isAndroid) {
      return bannerIds[mode]['android'];
    } else if (Platform.isIOS) {
      return bannerIds[mode]['ios'];
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  // static String get interstitialAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/7049598008";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/3964253750";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }

  // static String get rewardedAdUnitId {
  //   if (Platform.isAndroid) {
  //     return "ca-app-pub-3940256099942544/8673189370";
  //   } else if (Platform.isIOS) {
  //     return "ca-app-pub-3940256099942544/7552160883";
  //   } else {
  //     throw new UnsupportedError("Unsupported platform");
  //   }
  // }
}
