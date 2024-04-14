import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_brave/bloc/game_play_one_bloc.dart';
import 'package:test_task_brave/enum/cell_type_enum.dart';
import 'package:test_task_brave/widgets/cell_image_const.dart';

class BoxItem extends StatelessWidget {
  final bool isPerson;
  final int index;
  const BoxItem({
    super.key,
    required this.isPerson,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GamePlayOneBloc>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            bloc.cellList.elementAt(index).isOpen
                ? "assets/images/cells/${_switchImageCell(bloc.cellList.elementAt(index).cellType)}.png"
                : "assets/images/cells/${CellImage.close}.png",
          ),
        ),
      ),
      child: isPerson
          ? Image.asset(
              'assets/images/character_mike.png',
            )
          : const SizedBox(),
    );
  }

  String _switchImageCell(CellTypeEnum type) {
    switch (type) {
      case CellTypeEnum.close:
        return CellImage.close;
      case CellTypeEnum.empty:
        return CellImage.empty;
      case CellTypeEnum.gold:
        return CellImage.gold;
      case CellTypeEnum.emerald:
        return CellImage.emerald;
      case CellTypeEnum.diamond:
        return CellImage.diamond;
      case CellTypeEnum.exit:
        return CellImage.exit;
      case CellTypeEnum.luckyCoin:
        return CellImage.luckyCoin;
      case CellTypeEnum.shark:
        return CellImage.shark;
      case CellTypeEnum.unluckyCoin:
        return CellImage.unluckyCoin;
      case CellTypeEnum.worm:
        return CellImage.worm;
    }
  }
}
