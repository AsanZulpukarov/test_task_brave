import 'package:flutter/cupertino.dart';
import 'package:test_task_brave/enum/bonus_type_enum.dart';

abstract class BonusImage {
  static const gold = "gold";
  static const emerald = "emerald";
  static const diamond = "diamond";
  static const luckyCoin = "lucky_coin";
  static const shark = "shark";
  static const worm = "worm";
  static const unluckyCoin = "unlucky_coin";
  static const exit = "exit";
  static String bonusTypeToString(BonusTypeEnum  bonusType){
    switch(bonusType){
      case BonusTypeEnum.gold:
        return BonusImage.gold;
      case BonusTypeEnum.emerald:

        return BonusImage.emerald;
      case BonusTypeEnum.diamond:

        return BonusImage.diamond;
      case BonusTypeEnum.exit:

        return BonusImage.exit;
      case BonusTypeEnum.luckyCoin:

        return BonusImage.luckyCoin;
      case BonusTypeEnum.shark:

        return BonusImage.shark;
      case BonusTypeEnum.unluckyCoin:

        return BonusImage.unluckyCoin;
      case BonusTypeEnum.worm:

        return BonusImage.worm;
  }
}
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
