import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/errors/custom_exception.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/services/data_base_services.dart';
import 'package:e_commerce_app/core/services/firebase_auth_services.dart';
import 'package:e_commerce_app/core/services/shared_preference_singleton.dart';
import 'package:e_commerce_app/core/utils/backend_entpoint.dart';
import 'package:e_commerce_app/feature/auth/data/model/user_model.dart';
import 'package:e_commerce_app/feature/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DataBaseServices dataBaseServices;
  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.dataBaseServices,
  });

  //method delete user
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  // create user with email and password
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );
      await saveUserData(user: userEntity);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: LocaleKeys.FirbaseExecption_serverFailure.tr()),
      );
    }
  }

  // sign in with email and password
  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: LocaleKeys.FirbaseExecption_serverFailure.tr()),
      );
    }
  }

  // signIn With Google
  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user!);
      var isUserExists = await dataBaseServices.checkDataExixts(
        path: BackendEntpoint.isUsetExists,
        documentId: userEntity.uId,
      );
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: LocaleKeys.FirbaseExecption_noCompleted.tr()),
      );
    }
  }

  // signIn With Facebook
  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user!);
      var isUserExists = await dataBaseServices.checkDataExixts(
        path: BackendEntpoint.isUsetExists,
        documentId: userEntity.uId,
      );
      if (isUserExists) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: LocaleKeys.FirbaseExecption_noCompleted.tr()),
      );
    }
  }

  // add user data
  @override
  Future<void> addUserData({required UserEntity user}) async {
    await dataBaseServices.addData(
      path: BackendEntpoint.addUserdata,
      data: UserModel.fromEntity(user).toMap(),
      documnetId: user.uId,
    );
  }

  // get user data
  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await dataBaseServices.getData(
      path: BackendEntpoint.getUserdata,
      documentId: uid,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    var jsonDate = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonDate);
  }
}
