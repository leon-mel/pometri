part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final User user;

  HomeLoadedState({required this.user});
}

class HomeError extends HomeState{
  final String message;

  HomeError({required this.message});
}