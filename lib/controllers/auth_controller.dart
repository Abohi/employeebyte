import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:employeebyte/exception_handlers/custom_exception.dart';
import 'package:employeebyte/models/user_model/user_model.dart';
import 'package:employeebyte/providers/exception_provider/exception_provider.dart';
import 'package:employeebyte/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  (ref) => AuthController(ref.read),
);

class AuthController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }


  void signOut() async {
    await _read(authRepositoryProvider).signOut();
  }

  Future<void> loginUser(Map<String,dynamic>payload)async{
    try {
      await _read(authRepositoryProvider).signInUser(payload);
    } on CustomException catch (e) {
      _read(exceptionMessageProvider).state = e;
    }
  }

  Future<void> registerUser(Map<String,dynamic>payload)async{
    try {
      await _read(authRepositoryProvider).registerUser(payload);
    } on CustomException catch (e) {
      _read(exceptionMessageProvider).state = e;
    }
  }

  Future<UserModel>getUserModel()async{
    return await _read(authRepositoryProvider).getUserModel(state!.uid);
  }


  Future<void>sendEmailVerificationLink()async{
    try {
      await state!.sendEmailVerification();
      signOut();
    } on CustomException catch (e) {
      _read(exceptionMessageProvider).state = e;
    }
  }
}
