import 'package:dartz/dartz.dart';

abstract class Failure {}

class ServerFailure extends Failure {}

class GeneralFailure extends Failure {}
