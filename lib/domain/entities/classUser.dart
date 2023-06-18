import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? uName;
  final String? uAboutMe;
  final String? uLocation;
  
  final int? uAge;
  final List<String> uInterest;
  final List<String> imageUrls;

  const User( {
    required this.id,
    required this.uName,
    required this.uAboutMe,
    required this.uLocation,
    required this.uAge,
    required this.uInterest,
    required this.imageUrls});
    
      @override
      // TODO: implement props
    List<Object?> get props => [id, uName, uAboutMe, uAge, uLocation, uInterest, imageUrls];
}
