import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'swiping_event.dart';
part 'swiping_state.dart';

class SwipingBloc extends Bloc<SwipingEvent, SwipingState> {
  SwipingBloc() : super(SwipingInitial()) {
    on<SwipingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
