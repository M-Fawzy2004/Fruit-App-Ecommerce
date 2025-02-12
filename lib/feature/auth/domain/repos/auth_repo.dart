import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  // create user
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  // sign in
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  // sign in with google
  Future<Either<Failures, UserEntity>> signInWithGoogle();

  // sign in with facebook
  Future<Either<Failures, UserEntity>> signInWithFacebook();

  // add user data
  Future<void> addUserData({required UserEntity user});

  // get user data
  Future<UserEntity> getUserData({required String uid});

  // save user data
  Future<void> saveUserData({required UserEntity user});
}
