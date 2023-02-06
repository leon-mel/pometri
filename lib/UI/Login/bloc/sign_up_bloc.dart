import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc()
      : super(SignUpState(isSubmitting: false, showValidationMessages: false)) {
    on<RegisterWithEmailAndPasswordPressed>((event, emit) {
      // TODO: implement event handler
    });

    on<SignInWithEmailAndPasswordPressed>((event, emit) {
      // TODO: implement event handler
    });
  }
}
