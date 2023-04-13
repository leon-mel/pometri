part of 'swiping_bloc.dart';

abstract class SwipingState extends Equatable {
  const SwipingState();

  @override
  List<Object> get props => [];
}

class SwipingLoadingState extends SwipingState {}

class SwipingLoadedState extends SwipingState {
  final List<User> users;
  const SwipingLoadedState({required this.users});

  @override
  List<Object> get props => [users];
}

class SwipingErrorState extends SwipingState {}
