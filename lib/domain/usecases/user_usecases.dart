import 'package:dartz/dartz.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../entities/classUser.dart';
import '../failures/failures.dart';

class UserUsecases {
  Future sleep() {
    return Future.delayed(const Duration(seconds: 2));
  }

  Future<Either<Failure, User>> getUserUsecase() async {
    await sleep();

    return Right(User(
        "Agnes",
        "Hi friends, I'm Agnes. I'm a professional graphic desginer who is looking for new friends",
        "Bochum",
        27,
        ["Vegan", "Gym", "Hiking", "Watenball", "Guitar", "Music overall"]));
  }
}
