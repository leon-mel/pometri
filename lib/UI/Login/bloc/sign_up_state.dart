part of 'sign_up_bloc.dart';

class SignUpState {
  final bool isSubmitting;
  final bool showValidationMessages;

  SignUpState(
      {required this.isSubmitting, required this.showValidationMessages});
}
