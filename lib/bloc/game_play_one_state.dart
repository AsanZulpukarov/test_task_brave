part of 'game_play_one_bloc.dart';

sealed class GamePlayOneState extends Equatable {
  int currentIndex;
  int totalCoin;
  int currentCoin;
  GamePlayOneState({this.currentIndex = 0,this.currentCoin = 0,this.totalCoin = 100,});

  @override
  List<Object> get props => [currentIndex,currentCoin,totalCoin,];
}

class GamePlayOneLoadedState extends GamePlayOneState {

  GamePlayOneLoadedState({required super.currentIndex,required super.currentCoin,required super.totalCoin,});
  @override
  // TODO: implement props
  List<Object> get props => super.props;
}

class GamePlayOneErrorState extends GamePlayOneState {
  String message;
  GamePlayOneErrorState({required this.message,});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
