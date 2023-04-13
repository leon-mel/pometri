import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meta/meta.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {

  LottieBuilder welcomeAnimation =  Lottie.network("https://assets8.lottiefiles.com/packages/lf20_1t8na1gy.json");
  LottieBuilder datingAnimation =  Lottie.network("https://assets2.lottiefiles.com/packages/lf20_SLZG2B.json");
  LottieBuilder friendsAnimation =  Lottie.network("https://assets1.lottiefiles.com/packages/lf20_2cghrrpi.json");
  LottieBuilder startAnimation =  Lottie.network("https://assets1.lottiefiles.com/packages/lf20_sfiiilbf.json");

  WelcomeBloc() : super(WelcomeInitial()) {


    on<WelcomeEvent>((event, emit) async {
      emit(WelcomeLoading());
      await welcomeAnimation;
      await datingAnimation;
      await friendsAnimation;
      await startAnimation;
      emit(WelcomeLoaded(welcomeAnimation: welcomeAnimation, datingAnimation: datingAnimation, friendsAnimation: friendsAnimation, startAnimation: startAnimation));
    
      // TODO: implement event handler
    });
  }
}
