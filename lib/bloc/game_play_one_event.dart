part of 'game_play_one_bloc.dart';

sealed class GamePlayOneEvent extends Equatable {
  const GamePlayOneEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GamePlayOneMoveEvent extends GamePlayOneEvent {
  final int index;

  const GamePlayOneMoveEvent({required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}

class GamePlayOneShowBonusEvent extends GamePlayOneEvent {
  final int index;

  const GamePlayOneShowBonusEvent({required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
