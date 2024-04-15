import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_brave/enum/bonus_type_enum.dart';
import 'package:test_task_brave/enum/cell_type_enum.dart';
import 'package:test_task_brave/widgets/bonus_image_widget.dart';

part 'game_play_one_event.dart';

part 'game_play_one_state.dart';

class CellEntity {
  final int id;
  final CellTypeEnum cellType;
  bool isOpen;
  String bonusImage;

  CellEntity(
      {required this.id,
      this.cellType = CellTypeEnum.close,
      this.isOpen = false,
        required BonusTypeEnum bonusType,
        this.bonusImage = '',
      }){
    bonusImage = BonusImage.bonusTypeToString(bonusType);
  }
  static int coinForCellType(CellTypeEnum cellTypeEnum,int currentCoin){
    switch(cellTypeEnum){
      case CellTypeEnum.gold:
        return currentCoin+10;
      case CellTypeEnum.emerald:
        return currentCoin+15;
      case CellTypeEnum.diamond:
        return currentCoin+25;
      case CellTypeEnum.shark:
        return currentCoin-20;
      default :
        return currentCoin;
    }
  }
}

class GamePlayOneBloc extends Bloc<GamePlayOneEvent, GamePlayOneState> {
  List<CellEntity> cellList = List.generate(60, (index) {
    if (index == 0) {
      return CellEntity(
        id: index,
        isOpen: true,
        cellType: CellTypeEnum.exit,
        bonusType: BonusTypeEnum.exit,
      );
    } else {
      switch (index % 8) {
        case 0:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.diamond,
            bonusType: BonusTypeEnum.diamond,
          );
        case 1:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.emerald,
            bonusType: BonusTypeEnum.emerald,
          );
        case 2:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.gold,
            bonusType: BonusTypeEnum.gold,
          );
        case 3:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.luckyCoin,
            bonusType: BonusTypeEnum.luckyCoin,
          );
        case 4:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.shark,
            bonusType: BonusTypeEnum.shark,
          );
        case 5:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.unluckyCoin,
            bonusType: BonusTypeEnum.unluckyCoin,
          );
        case 6:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.worm,
            bonusType: BonusTypeEnum.worm,
          );
        case 7:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.shark,
            bonusType: BonusTypeEnum.shark,
          );
        default:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.empty,
            bonusType: BonusTypeEnum.exit,
          );
      }
    }
  });
  GamePlayOneBloc() : super(GamePlayOneLoadedState(currentIndex: 0,totalCoin: 100,currentCoin: 0,)) {
    int currentIndex= state.currentIndex;
    int currentCoin= state.currentCoin;
    int totalCoin= state.totalCoin;
    on<GamePlayOneMoveEvent>((event, emit) {
      currentIndex = event.index;
      cellList.elementAt(event.index).isOpen = true;
      emit(GamePlayOneLoadedState(currentCoin: currentCoin,currentIndex: currentIndex,totalCoin: totalCoin));
    });
    on<GamePlayOneShowBonusEvent>((event, emit) {
      CellEntity cellEntity= cellList.elementAt(event.index);
      currentCoin = CellEntity.coinForCellType(cellEntity.cellType,state.currentCoin);
      if(cellEntity.cellType == CellTypeEnum.shark) {
        totalCoin = (state.totalCoin * 0.95).toInt();
      }
        emit(GamePlayOneLoadedState(currentCoin: currentCoin,currentIndex: currentIndex,totalCoin: totalCoin));

    });
  }
}
