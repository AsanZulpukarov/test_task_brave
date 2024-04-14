import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_brave/enum/cell_type_enum.dart';

part 'game_play_one_event.dart';

part 'game_play_one_state.dart';

class CellEntity {
  int id;
  CellTypeEnum cellType;
  bool isOpen;
  int coin;

  CellEntity(
      {required this.id,
      this.cellType = CellTypeEnum.close,
      this.isOpen = false,
      this.coin = 0});
}

class GamePlayOneBloc extends Bloc<GamePlayOneEvent, GamePlayOneState> {
  List<CellEntity> cellList = List.generate(60, (index) {
    if (index == 0) {
      return CellEntity(
        id: index,
        isOpen: true,
        cellType: CellTypeEnum.exit,
        coin: 0,
      );
    } else {
      switch (index % 8) {
        case 0:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.diamond,
            coin: 25,
          );
        case 1:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.emerald,
            coin: 15,
          );
        case 2:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.gold,
            coin: 10,
          );
        case 3:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.luckyCoin,
            coin: 0,
          );
        case 4:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.shark,
            coin: 0,
          );
        case 5:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.unluckyCoin,
            coin: 0,
          );
        case 6:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.worm,
            coin: 0,
          );
        case 7:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.shark,
            coin: 0,
          );
        default:
          return CellEntity(
            id: index,
            isOpen: false,
            cellType: CellTypeEnum.empty,
            coin: 0,
          );
      }
    }
  });
  int currentIndex = 0;
  int totalCoin = 100;
  int currentCoin = 0;
  GamePlayOneBloc() : super(GamePlayOneInitialState()) {
    on<GamePlayOneMoveEvent>((event, emit) {
      currentIndex = event.index;
      cellList.elementAt(event.index).isOpen = true;
      emit(GamePlayOneInitialState());
    });
    on<GamePlayOneShowBonusEvent>((event, emit) {
      currentCoin += cellList.elementAt(event.index).coin;
      emit(GamePlayOneInitialState());
    });
  }
}
