// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/feature/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';
part 'signin_cubit_state.dart';

class SigninCubit extends Cubit<SigninCubitState> {
  SigninCubit(this.authRepo) : super(SigninCubitInitial());

  final AuthRepo authRepo;

  // Sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninCubitLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(SigninCubitFailure(message: failure.message));
      },
      (userEntity) {
        emit(SigninCubitSuccess(userEntity: userEntity));
      },
    );
  }

  // Sign in with google
  Future<void> signInWithGoogle() async {
    emit(SigninCubitLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) {
        emit(SigninCubitFailure(message: failure.message));
      },
      (userEntity) {
        emit(SigninCubitSuccess(userEntity: userEntity));
      },
    );
  }

  // Sign in with facebook
  Future<void> signInWithFacebook() async {
    emit(SigninCubitLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) {
        emit(SigninCubitFailure(message: failure.message));
      },
      (userEntity) {
        emit(SigninCubitSuccess(userEntity: userEntity));
      },
    );
  }

  // verfy phone number
  Future<void> verfPhoneNumber(String phoneNumber) async {
    emit(SigninCubitLoading());
    var result = await authRepo.verfPhoneNumber(phoneNumber);
    result.fold(
      (failure) {
        emit(SigninCubitFailure(message: failure.message));
      },
      (userEntity) {
        emit(SigninCubitSuccess(userEntity: userEntity));
      },
    );
  }
}
