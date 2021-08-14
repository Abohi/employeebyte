import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:employeebyte/exception_handlers/custom_exception.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/models/country_model/countries_model.dart';
import 'package:employeebyte/models/user_model/user_model.dart';
import 'package:employeebyte/providers/general_app_providers/general_providers.dart';
import 'package:employeebyte/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:employeebyte/firebase_reference_extensions/firebase_firestore_extension.dart';
import 'package:http/http.dart' as http;

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;

  Future<void> signInUser(Map<String, dynamic> payload);

  Future<void> registerUser(Map<String, dynamic> payload);
  Future<void> saveEmployeeRecord(Map<String, dynamic> payload);
  Future<UserModel> getUserModel(String userId);

  User? getCurrentUser();

  Future<void> signOut();

  Future<Either<NetworkFailure, CountriesModel>> getCountriesAndState();
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository {
  final Reader _read;

  const AuthRepository(this._read);

  @override
  Stream<User?> get authStateChanges =>
      _read(firebaseAuthProvider).authStateChanges();

  @override
  User? getCurrentUser() {
    try {
      return _read(firebaseAuthProvider).currentUser;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signInUser(Map<String, dynamic> payload) async {
    try {
      await _read(firebaseAuthProvider).signInWithEmailAndPassword(
          email: payload["email"], password: payload["password"]);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> registerUser(Map<String,dynamic> payload) async {
    try {
      UserCredential userCredential = await _read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(
              email: payload["email"]!, password: payload["password"]!);
      if (userCredential.user != null) {
        UploadTask storageUploadTask;
        storageUploadTask =  _read(firebaseStorageProvider)
            .ref()
            .child(adminCollection)
            .child(userCredential.user!.uid)
            .child("profile_photo")
            .child(userCredential.user!.uid)
            .putFile(payload["photo"]);
        String photoUrl = await (await storageUploadTask).ref.getDownloadURL();

        await _read(firebaseFirestoreProvider)
            .userDocumentRef(userCredential.user!.uid)
            .set(UserModel(dateOfBirth: payload["dateOfBirth"],
            address: payload["address"],country: payload["country"],
            state: payload["state"],sex: payload["sex"],firstName: payload["firstName"],lastName: payload["lastName"], photo: photoUrl));
        await userCredential.user!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<UserModel> getUserModel(String userId) async {
    try {
      UserModel userModel =
          (await _read(firebaseFirestoreProvider).userDocumentRef(userId).get())
              .data()!;
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Either<NetworkFailure,CountriesModel>> getCountriesAndState() async{
    var headers = {'Content-Type': 'application/json'};
    try {
      return http
          .get(Uri.parse("https://api.printful.com/countries"),
              headers: headers)
          .then((data) {
        var jsonDecode = json.decode(data.body);
        if (data.statusCode == 200) {
          return right(CountriesModel.fromJson(jsonDecode));
        } else {
          return right(CountriesModel.fromJson(jsonDecode));
        }
      });
    } on NetworkFailure catch (e) {
      return left(e);
    } on Exception catch (e) {
      return left(GeneralException(e.toString()));
    }
  }

  @override
  Future<void> saveEmployeeRecord(Map<String, dynamic> payload) async{
    try {

    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
