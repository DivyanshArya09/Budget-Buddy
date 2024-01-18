import 'package:cipherx_expense_tracker_app/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRemoteDataSource {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addInitialIncome(String uid) async {
    firebaseFirestore
        .collection('users')
        .doc(uid)
        .collection('account')
        .doc('accountDetails')
        .set(
      {
        'total_income': 0,
        'total_money': 0,
        'total_expense': 0,
      },
    );
  }

  Future<void> saveUser(UserModel userModel, String uid) async {
    await firebaseFirestore
        .collection('users')
        .doc(uid)
        .set(userModel.toJson());
  }

  Future<UserModel> getUser(String uid) async {
    try {
      final snapshot =
          await firebaseFirestore.collection('users').doc(uid).get();
      if (snapshot.exists) {
        return UserModel.fromJson(snapshot.data()!);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteUser(String uid) async {
    await firebaseFirestore.collection('users').doc(uid).delete();
  }
}
