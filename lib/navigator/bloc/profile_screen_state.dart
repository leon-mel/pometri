part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenState {}

class ProfileScreenInitial extends ProfileScreenState {}

class ProfileScreenLoading extends ProfileScreenState {}

class ProfileScreenLoaded extends ProfileScreenState {
  final List<User> user;
  ProfileScreenLoaded({required this.user});
}

class ProfileScreenError extends ProfileScreenState {
  final String message;

  ProfileScreenError({required this.message});
}

class ProfileImageChangeInitial extends ProfileScreenState {}

class ProfileImageChangeUpload extends ProfileScreenState {}

class ProfileImageChangeLoaded extends ProfileScreenState {
  final File imageFile;
  final String downloadURL;
  ProfileImageChangeLoaded(this.imageFile, this.downloadURL);
}
