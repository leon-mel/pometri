part of 'swiping_bloc.dart';

abstract class SwipingEvent extends Equatable {
  const SwipingEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends SwipingEvent {

  final List<User> users;

  LoadUserEvent({required this.users});

   @override
  List<Object> get props => [users];

}




class SwipeLeft extends SwipingEvent {
  final User user;

  SwipeLeft({required this.user});

   @override
  List<Object> get props => [user];
}

class SwipeRight extends SwipingEvent {
  final User user;

  SwipeRight({required this.user});

   @override
  List<Object> get props => [user];
}

class SwipingLoadingEvent extends SwipingEvent {}