import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:speeddatingapp/domain/entities/classUser.dart';
import 'package:speeddatingapp/domain/usecases/user_usecases.dart';

import '../../../domain/failures/failures.dart';

part 'swiping_event.dart';
part 'swiping_state.dart';

class SwipingBloc extends Bloc<SwipingEvent, SwipingState> {
  Future sleep1 = Future.delayed(Duration(seconds: 2));
  final usecases = UserUsecases();
  SwipingBloc() : super(SwipingLoadingState()) {
    on<SwipingLoadingEvent>((event, emit) async {
      emit(SwipingLoadingState());

      Either<Failure, List<User>> users = await usecases.getUserUsecase();

      users.fold((l) => emit(SwipingErrorState()),
          (r) => emit(SwipingLoadedState(users: r)));
    });

    on<LoadUserEvent>((event, emit) {
      LoadUserEvent? event;
      emit(SwipingLoadedState(users: event!.users));
    });

    on<SwipeLeft>((event, emit) {
      SwipeLeft? event;
      SwipingState? state;
      if (state is SwipingLoadedState) {
        try {
          emit(SwipingLoadedState(
              users: List.from(state.users)..remove(event!.user)));
        } catch (_) {}
      }
    });
    
    on<SwipeRight>((event, emit) {
      SwipeRight? event;
      SwipingState? state;
      if (state is SwipingLoadedState) {
        try {
          emit(SwipingLoadedState(
              users: List.from(state.users)..remove(event!.user)));
        } catch (_) {}
      }
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
