import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:speeddatingapp/domain/failures/failures.dart';
import 'package:speeddatingapp/domain/usecases/user_usecases.dart';

import '../../domain/entities/classUser.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  Future sleep1 = Future.delayed(Duration(seconds: 2));
  final usecases = UserUsecases();
  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    on<ProfileScreenLoadingEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileScreenLoading());
      await sleep1;

      Either<Failure, User> userOrFailure = await usecases.getUserUsecase();

      userOrFailure.fold(
          (l) => emit(ProfileScreenError(message: _mapFailureToMessage(l)!)),
          (r) => emit(ProfileScreenLoaded(user: r)));
    });
  }

  String? _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ups, couldn't connect to the Server! Please try again";
      case GeneralFailure:
        return "Ups, something went wrong! Please try again.";

      default:
        "Ups, something went wrong! Please try again.";
    }
    return null;
  }
}
