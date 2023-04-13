


import 'package:lottie/lottie.dart';
import 'package:speeddatingapp/domain/entities/classLottie.dart';

class LottieUsecases {

Future<LottieAnimation> getLottieUsecasesOne() async {
  
  return LottieAnimation(Lottie.network("https://assets8.lottiefiles.com/packages/lf20_1t8na1gy.json"));
}

}