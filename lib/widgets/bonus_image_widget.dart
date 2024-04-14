import 'package:flutter/cupertino.dart';

abstract class BonusImage {
  static const gold = "gold";
  static const emerald = "emerald";
  static const diamond = "diamond";
  static const luckyCoin = "lucky_coin";
  static const shark = "shark";
  static const worm = "worm";
  static const unluckyCoin = "unlucky_coin";
}

class BonusImageWidget extends StatelessWidget {
  final String bonusImage;
  final double height;
  final double width;
  const BonusImageWidget({
    super.key,
    required this.bonusImage,
    this.width = 200,
    this.height = 210,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/bonuses/$bonusImage.png",
      height: height,
      width: width,
    );
  }
}
