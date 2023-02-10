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

    return right(User(
        "Agnes", "Kill me", "Bochum", 27, ["Vegan", "Hiking", "Chilling"]));
  }

  Future<Either<Failure, User>> getUserUsecase2() async {
    return right(User("Matthew", "Looking for friends and fucking", "Bochum",
        24, ["Vegan", "Hiking", "Gaming"]));
  }
}
