part of 'swiping_bloc.dart';

abstract class SwipingEvent extends Equatable {
  const SwipingEvent();

  @override
  List<Object> get props => [];
}

class LoadUserEvent extends SwipingEvent {

  final List<User> users;

  const LoadUserEvent({required this.users});

   @override
  List<Object> get props => [users];

}




class SwipeLeft extends SwipingEvent {
  final User user;

  const SwipeLeft({required this.user});

   @override
  List<Object> get props => [user];
}

class SwipeRight extends SwipingEvent {
  final User user;

  const SwipeRight({required this.user});

   @override
  List<Object> get props => [user];
}

class SwipingLoadingEvent extends SwipingEvent {}