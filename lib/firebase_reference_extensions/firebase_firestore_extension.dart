import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employeebyte/models/employee_model/employee_model.dart';
import 'package:employeebyte/models/user_model/user_model.dart';
import 'package:employeebyte/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';


extension AuthFirebaseFirestoreExtentsion on FirebaseFirestore {
  DocumentReference<UserModel> userDocumentRef(String userId)=>
      collection(adminCollection).doc(userId).withConverter<UserModel>(fromFirestore: (snapshots,_)=>UserModel.fromJson(snapshots.data()!), toFirestore: (usermodel,_)=>usermodel.toJson());

  CollectionReference<EmployeeModel> employeeCollectionRef()=>
      collection(employeeCollection).withConverter<EmployeeModel>(fromFirestore: (snapshots,_)=>EmployeeModel.fromJson(snapshots.data()!), toFirestore: (employeeModel,_)=>employeeModel.toJson());


}