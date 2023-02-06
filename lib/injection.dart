

import 'package:get_it/get_it.dart';
import 'package:speeddatingapp/UI/Login/bloc/sign_up_bloc.dart';

final sl = GetIt.I; // sl == service locator

Future<void> init() async {

  // state mangement
  sl.registerFactory(() => SignUpBloc());

}