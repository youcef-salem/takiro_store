import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/controlers/auth_conteroler.dart';
import 'package:takiro_store/services/Auth.dart';

class ProfilePage extends StatelessWidget {
 const  ProfilePage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Consumer<auth_controler>(
      builder: (_t, auth_controler value, __) {
        return Center(
          child: TextButton(
            onPressed: () {
              value.logout();
            },
            child: Text("LOGOUT"),
          ),
        );
      },
    );
  }
}
