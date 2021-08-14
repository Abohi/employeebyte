import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:employeebyte/exception_handlers/custom_exception.dart';
import 'package:employeebyte/models/employee_model/employee_model.dart';
import 'package:employeebyte/models/user_model/user_model.dart';
import 'package:employeebyte/providers/exception_provider/exception_provider.dart';
import 'package:employeebyte/repositories/auth_repository.dart';
import 'package:employeebyte/repositories/employee_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final employeeControllerProvider = StateNotifierProvider<EmployeeController, List<EmployeeModel>?>(
  (ref) => EmployeeController(ref.read),
);

class EmployeeController extends StateNotifier<List<EmployeeModel>?> {
  final Reader _read;

  StreamSubscription<QuerySnapshot<EmployeeModel>?>? _employeeCollectionSubscription;

  EmployeeController(this._read) : super(null) {
    _employeeCollectionSubscription?.cancel();
    _employeeCollectionSubscription = _read(employeeRepositoryProvider)
        .getSavedEmployeeRecord()
        .listen((employeeModelSnapShot) => state = employeeModelSnapShot.docs.map((e) => e.data()).toList());
  }

  @override
  void dispose() {
    _employeeCollectionSubscription?.cancel();
    super.dispose();
  }

  Future<void> saveEmployeeRecord(Map<String,dynamic>payload)async{
    try {
      await _read(employeeRepositoryProvider).saveEmployeeRecord(payload);
    } on CustomException catch (e) {
      _read(exceptionMessageProvider).state = e;
    }
  }

}
