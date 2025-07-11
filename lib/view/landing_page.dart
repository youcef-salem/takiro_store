import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/controlers/Data_base.dart';
import 'package:takiro_store/controlers/auth_conteroler.dart';
import 'package:takiro_store/view/BototmNavbar.dart';
import 'package:takiro_store/services/Auth.dart';
import 'package:takiro_store/view/auth.dart' as auth_view;

class Laanding_page extends StatelessWidget {
  const Laanding_page({super.key});

  @override
  Widget build(BuildContext context) {
    final Auth = Provider.of<AuthBase>(context, listen: false);
    final db = Provider.of<fire_store_db>(context);
    return ChangeNotifierProvider<auth_controler>(
              create: (_) => auth_controler(auth: Auth,dba: db),
              child: 
    StreamBuilder<User?>(
      stream: Auth.authStateChanges,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.active) {
          final user = asyncSnapshot.data;
          if (user == null) {
            return auth_view.Auth();
          } else {
            return const BottomNavbar();
          }
        }
       

       
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },)
    );
  }
}
