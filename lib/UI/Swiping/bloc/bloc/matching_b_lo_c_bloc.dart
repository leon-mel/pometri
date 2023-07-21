import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'matching_b_lo_c_event.dart';
part 'matching_b_lo_c_state.dart';

class MatchingBLoCBloc extends Bloc<MatchingBLoCEvent, MatchingBLoCState> {
  MatchingBLoCBloc() : super(MatchingBLoCInitial()) {
    on<MatchingBLoCEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
