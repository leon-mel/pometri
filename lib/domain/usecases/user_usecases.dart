import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../entities/classUser.dart';

class UserUsecases {
  Future sleep() {
    return Future.delayed(const Duration(seconds: 2));
  }

  Future<User> getUserUsecase() async {
    await sleep();
    return User(
        "Agnes",
        "Hi friends, I'm Agnes. I'm a professional graphic desginer who is looking for new friends",
        "Bochum",
        27,
        ["Vegan", "Gym", "Hiking"]);
  }
}
