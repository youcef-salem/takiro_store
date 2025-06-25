import 'package:firebase_auth/firebase_auth.dart';

class ApiPath {
  static const products = "products/";
  static  User(String uid ) => "users/$uid/";
}
