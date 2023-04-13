import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:speeddatingapp/domain/failures/failures.dart';
import 'package:speeddatingapp/domain/usecases/user_usecases.dart';
import 'package:speeddatingapp/navigator/bloc/profile_screen_bloc.dart';

import '../../../domain/entities/classUser.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    Future sleep1 = Future.delayed(Duration(seconds: 3));

    final usecases = UserUsecases();
    on<HomeLoading>((event, emit) async {
      // TODO: implement event handler
      emit(HomeLoadingState());
      await sleep1;
      Either<Failure, List<User>> userOrFailure2 = await usecases.getUserUsecase();

      userOrFailure2.fold(
          (l) => emit(HomeError(message: _mapFailureToMessage2(l)!)),
          (r) => emit(HomeLoadedState(user: r)));
    });
  }
  String? _mapFailureToMessage2(Failure failure) {
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
