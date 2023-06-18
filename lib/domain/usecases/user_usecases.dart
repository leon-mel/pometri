import 'package:dartz/dartz.dart';

import '../entities/classUser.dart';
import '../failures/failures.dart';

class UserUsecases {
  Future sleep() {
    return Future.delayed(const Duration(seconds: 2));
  }

  List<User> users = [];

  Future<Either<Failure, List<User>>> getUserUsecase() async {
    

    return right(users = [
      const User(
          id: 1,
          imageUrls: ["assets/User_1.jpg", ""],
          uAboutMe: 'Want to find new friends',
          uAge: 22,
          uInterest: ["Hiking", "Vegan", "Soccer"],
          uLocation: 'Bochum',
          uName: 'Agnes'),
      const User(
          id: 2,
          imageUrls: ["assets/User_2.jpg"],
          uAboutMe: 'Want to find new friends',
          uAge: 25,
          uInterest: ["Hiking", "Gaming", "Baseball"],
          uLocation: 'Dortmund',
          uName: 'Matthew'),
          const User(
          id: 3,
          imageUrls: ["assets/User_3.jpg"],
          uAboutMe: 'Want to find new friends',
          uAge: 25,
          uInterest: ["Hiking", "Gaming", "Baseball"],
          uLocation: 'Dortmund',
          uName: 'Kim'),
          const User(
          id: 4,
          imageUrls: ["assets/User_4.jpg"],
          uAboutMe: 'Want to find new friends',
          uAge: 25,
          uInterest: ["Hiking", "Gaming", "Baseball"],
          uLocation: 'Dortmund',
          uName: 'Sam'),
          const User(
          id: 5,
          imageUrls: ["assets/User_5.jpg"],
          uAboutMe: 'Want to find new friends',
          uAge: 25,
          uInterest: ["Hiking", "Gaming", "Baseball"],
          uLocation: 'Dortmund',
          uName: 'Matthew')
    ]);
  }
}

