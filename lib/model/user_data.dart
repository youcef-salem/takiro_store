import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserData {
  final String uid;
  final String email; 
  UserData({
    required this.uid,
    required this.email,
  });


  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map ,String doc_id ) {
    return UserData(
      uid: doc_id ,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  

  @override
  String toString() => 'UserData(uid: $uid, email: $email)';
}
