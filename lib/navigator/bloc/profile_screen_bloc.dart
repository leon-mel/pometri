import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
      User user = await usecases.getUserUsecase();
      emit(ProfileScreenLoaded(user: user));
    });
  }
}
