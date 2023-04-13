part of 'welcome_bloc.dart';

@immutable
abstract class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeLoading extends WelcomeState {}

class WelcomeLoaded extends WelcomeState {
  final LottieBuilder welcomeAnimation;
  final LottieBuilder datingAnimation;
  final LottieBuilder friendsAnimation;
  final LottieBuilder startAnimation;
  WelcomeLoaded({required this.welcomeAnimation,required this.datingAnimation,required this.friendsAnimation,required this.startAnimation});
}
