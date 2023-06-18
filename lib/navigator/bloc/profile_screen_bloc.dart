import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:speeddatingapp/domain/failures/failures.dart';
import 'package:speeddatingapp/domain/usecases/user_usecases.dart';

import '../../domain/entities/classUser.dart';

part 'profile_screen_event.dart';
part 'profile_screen_state.dart';

class ProfileScreenBloc extends Bloc<ProfileScreenEvent, ProfileScreenState> {
  Future sleep1 = Future.delayed(const Duration(seconds: 2));
  final usecases = UserUsecases();
  File? imageFile;
  final picker = ImagePicker();
  ProfileScreenBloc() : super(ProfileScreenInitial()) {
    on<ProfileScreenLoadingEvent>((event, emit) async {
      // TODO: implement event handler
      emit(ProfileScreenLoading());
      await sleep1;

      Either<Failure, List<User>> userOrFailure =
          await usecases.getUserUsecase();

      userOrFailure.fold(
          (l) => emit(ProfileScreenError(message: _mapFailureToMessage(l)!)),
          (r) => emit(ProfileScreenLoaded(user: r)));
    });

    on<ProfileImageChangeEvent>((event, emit) {
      emit(ProfileImageChangeInitial());
    });

    on<ProfileImageChangeUploadEvent>((event, emit) async {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        if (imageFile == null) return;
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child("images")
            .child("user_id.jpg");
        await ref.putFile(imageFile!);
        String downloadURL = await ref.getDownloadURL();
        emit(ProfileImageChangeLoaded(imageFile!, downloadURL));
      }
    });
    
    on<ProfileImageChangeTakePhotoEvent>((event, emit) async {
      final pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        if (imageFile == null) return;
        firebase_storage.Reference ref = firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child("images")
            .child("user_id.jpg");
        await ref.putFile(imageFile!);
        String downloadURL = await ref.getDownloadURL();
        emit(ProfileImageChangeLoaded(imageFile!, downloadURL));
      }
    });
  }

  String? _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Ups, couldn't connect to the Server! Please try again";
      case GeneralFailure:
        return "Ups, something went wrong! Please try again.";

      default:
        "Ups, something went wrong! Please try again.";
    }
    return null;
  }
}
