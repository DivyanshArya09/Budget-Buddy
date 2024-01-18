import 'dart:convert';

import 'package:cipherx_expense_tracker_app/auth/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  final SharedPreferences sharedPreferences;

  const LocalDataSource({required this.sharedPreferences});

  Future<void> setIsNewUser() async {
    try {
      sharedPreferences.setBool('isNew', false);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> isNewUser() async {
    // sharedPreferences =   await SharedPreferences.getInstance();
    try {
      return sharedPreferences.getBool('isNew') ?? true;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> saveUser(UserModel userModel) async {
    // sharedPreferences = await SharedPreferences.getInstance();
    try {
      await sharedPreferences.remove('user');
      final map = userModel.toJson();
      final userMap = jsonEncode(map);
      await sharedPreferences.setString('user', userMap);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> getUser() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    try {
      final userMap = sharedPreferences.getString('user');
      if (userMap == null) {
        throw Exception();
      }
      final user = UserModel.fromJson(jsonDecode(userMap));
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteUser() async {
    await sharedPreferences.remove('user');
  }
}
