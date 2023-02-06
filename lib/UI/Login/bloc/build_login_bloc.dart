import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'build_login_event.dart';
part 'build_login_state.dart';

class BuildLoginBloc extends Bloc<BuildLoginEvent, BuildLoginState> {
  BuildLoginBloc() : super(BuildLoginInitial()) {
    on<BuildLoginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
