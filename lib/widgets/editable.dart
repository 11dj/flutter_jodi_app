// import 'package:flutter/material.dart';

// class TextEditWidget extends StatelessWidget {
//   @override
//   void initState() {
//     _initAdMob();
//     _textController.text = initText;
//     _bannerAd = BannerAd(
//       adUnitId: AdManager.bannerAdUnitId,
//       size: AdSize.banner,
//     );
//     _loadBannerAd();
//     super.initState();
//   }

//   Future<void> _initAdMob() {
//     return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
//   }

//   void _loadBannerAd() {
//     _bannerAd
//       ..load()
//       ..show(anchorType: AnchorType.top);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
