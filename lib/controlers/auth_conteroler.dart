import 'package:flutter/material.dart';
import 'package:takiro_store/services/Auth.dart';
import 'package:takiro_store/utilities/enums.dart';

class auth_controler with ChangeNotifier {
  final AuthBase auth;

  String email;

  String password;

  Auth_Form_TYpe type;


  void update_email(String email){
copyWith(email: email);
  notifyListeners();

  } 
  void update_password(String password){
    copyWith(password: password);
    notifyListeners();
  }
  void togle_type(){
   final curent_type = type;
   type = curent_type == Auth_Form_TYpe.login ? Auth_Form_TYpe.register : Auth_Form_TYpe.login;
       copyWith(
         type: type,
         email:'',
         password: ''
       );
    notifyListeners();
  }
  Future<void> submit() async {
  try {
    if (type == Auth_Form_TYpe.login) {
      await auth.Login_with_email_and_password(email, password);
    } else {
      await auth.Signup_with_email_and_password(email, password);
    }
    copyWith(
      email: '',
      password: '',
    );
  } catch (e) {
    rethrow; // Use rethrow instead of creating a new exception
  }
  notifyListeners();
}

  auth_controler({
    required this.auth,
    this.email = '',
    this.password = '',
    this.type = Auth_Form_TYpe.login,

  });
  void  copyWith({

    String ?email,
    String ?password,
    Auth_Form_TYpe ?type,

  }){
      this.email = email ?? this.email;
     this.password = password ?? this.password;
      this.type = type ?? this.type;
      notifyListeners();
  }

}






