part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenState {}

class ProfileScreenInitial extends ProfileScreenState {}

class ProfileScreenLoading extends ProfileScreenState {}

class ProfileScreenLoaded extends ProfileScreenState {
  final User user;
  ProfileScreenLoaded({required this.user});
}

class ProfileScreenError extends ProfileScreenState {
  final String message;

  ProfileScreenError({required this.message});
}
