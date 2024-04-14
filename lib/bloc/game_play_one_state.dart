part of 'game_play_one_bloc.dart';

sealed class GamePlayOneState extends Equatable {
  const GamePlayOneState();

  @override
  List<Object> get props => [];
}

final class GamePlayOneInitialState extends GamePlayOneState {}

final class GamePlayOneLoadingState extends GamePlayOneState {}

final class GamePlayOneLoadedState extends GamePlayOneState {}

final class GamePlayOneErrorState extends GamePlayOneState {
  String message;
  GamePlayOneErrorState({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
