// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/feature/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';
part 'signup_cubit_state.dart';

class SignupCubit extends Cubit<SignupCubitState> {
  SignupCubit(this.authRepo) : super(SignupCubitInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String name, String password) async {
    emit(SignupCubitLoading());
    var result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) {
        emit(SignupCubitFailure(message: failure.message));
      },
      (userEntity) {
        emit(SignupCubitSuccess(userEntity: userEntity));
      },
    );
  }
}
