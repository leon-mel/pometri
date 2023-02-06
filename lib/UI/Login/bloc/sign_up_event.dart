part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class RegisterWithEmailAndPasswordPressed extends SignUpEvent {
  final String email;
  final String uname;

  RegisterWithEmailAndPasswordPressed(
      {required this.email, required this.uname});
}

class SignInWithEmailAndPasswordPressed extends SignUpEvent {
  final String email;
  final String uname;

  SignInWithEmailAndPasswordPressed({required this.email, required this.uname});
}
