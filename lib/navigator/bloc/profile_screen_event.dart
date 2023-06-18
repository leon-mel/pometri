part of 'profile_screen_bloc.dart';

@immutable
abstract class ProfileScreenEvent {}

class ProfileScreenLoadingEvent extends ProfileScreenEvent {}

class ProfileImageChangeEvent extends ProfileScreenEvent{}

class ProfileImageChangeUploadEvent extends ProfileScreenEvent{}

class ProfileImageChangeTakePhotoEvent extends ProfileScreenEvent{}


