part of 'swiping_bloc.dart';

abstract class SwipingState extends Equatable {
  const SwipingState();
  
  @override
  List<Object> get props => [];
}

class SwipingInitial extends SwipingState {}
