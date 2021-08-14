import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:employeebyte/exception_handlers/custom_exception.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/exception_handlers/network_failure_exception.dart';
import 'package:employeebyte/models/country_model/countries_model.dart';
import 'package:employeebyte/models/employee_model/employee_model.dart';
import 'package:employeebyte/models/user_model/user_model.dart';
import 'package:employeebyte/providers/general_app_providers/general_providers.dart';
import 'package:employeebyte/providers/state_providers/employee_state_provider.dart';
import 'package:employeebyte/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:employeebyte/firebase_reference_extensions/firebase_firestore_extension.dart';
import 'package:http/http.dart' as http;

abstract class BaseEmployeeRepository {
  Future<void> saveEmployeeRecord(Map<String, dynamic> payload);
  Stream<QuerySnapshot<EmployeeModel>> getSavedEmployeeRecord();
  Future<Either<NetworkFailure, CountriesModel>> getCountriesAndState();
}

final employeeRepositoryProvider =
Provider<EmployeeRepository>((ref) => EmployeeRepository(ref.read));

class EmployeeRepository implements BaseEmployeeRepository{
  final Reader _read;

  const EmployeeRepository(this._read);

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
      String photoId = await _read(firebaseFirestoreProvider).collection(employeeCollection).doc().id;
      UploadTask storageUploadTask;
      storageUploadTask =  _read(firebaseStorageProvider)
          .ref()
          .child(employeeCollection)
          .child(photoId)
          .child("profile_photo")
          .child(photoId)
          .putFile(payload["photo"]);
      String photoUrl = await (await storageUploadTask).ref.getDownloadURL();
      EmployeeModel employeeModel = EmployeeModel(dateOfBirth: payload["dateOfBirth"],
          address: payload["address"],country: payload["country"],
          state: payload["state"],sex: payload["sex"],firstName: payload["firstName"],lastName: payload["lastName"], photo: photoUrl, designation: payload["designation"]);
      _read(employeeStateProvider).state= employeeModel;
      await _read(firebaseFirestoreProvider)
          .employeeCollectionRef().add(employeeModel);
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Stream<QuerySnapshot<EmployeeModel>> getSavedEmployeeRecord() {
    return _read(firebaseFirestoreProvider).employeeCollectionRef().snapshots();
  }
}
