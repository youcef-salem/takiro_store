import 'package:flutter/material.dart';

import 'package:takiro_store/controlers/Data_base.dart' as db;
import 'package:takiro_store/model/user_data.dart';
import 'package:takiro_store/services/Auth.dart';

import 'package:takiro_store/utilities/enums.dart';

class auth_controler with ChangeNotifier {
  final AuthBase auth;
  String email;
  String password;
  Auth_Form_TYpe type;
  final db.fire_store_db dba;
  void update_email(String email) {
    copyWith(email: email);
    notifyListeners();
  }

  void update_password(String password) {
    copyWith(password: password);
    notifyListeners();
  }

  void togle_type() {
    final curent_type = type;
    type =
        curent_type == Auth_Form_TYpe.login
            ? Auth_Form_TYpe.register
            : Auth_Form_TYpe.login;
    copyWith(type: type, email: '', password: '');
    notifyListeners();
  }

  String get_uuid() {
    final uid = auth.currentUser?.uid;

    return uid ?? '';
  }

  Future<void> submit() async {
    try {
      if (type == Auth_Form_TYpe.login) {
        await auth.Login_with_email_and_password(email, password);
      } else {
        final user = await auth.Signup_with_email_and_password(email, password);

        if (user == null || user.uid.isEmpty) {
          throw Exception('Failed to create user account');
        }

        await dba.set_user_data(
          UserData(uid: user.uid, email: email),
          user.uid,
        );

        copyWith(email: '', password: '');
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  void logout() async {
    await auth.logoutOut();
  }

  auth_controler({
    required this.auth,
    required this.dba,
    this.email = '',
    this.password = '',
    this.type = Auth_Form_TYpe.login,
  });
  void copyWith({String? email, String? password, Auth_Form_TYpe? type}) {
    this.email = email ?? this.email;
    this.password = password ?? this.password;
    this.type = type ?? this.type;
    notifyListeners();
  }
}
