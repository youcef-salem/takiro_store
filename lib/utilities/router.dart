import 'package:flutter/material.dart';
import 'package:takiro_store/utilities/routes.dart';
import 'package:takiro_store/view/BototmNavbar.dart';


import 'package:takiro_store/view/auth.dart';

Route<dynamic> ongenerateRoute(RouteSettings settings) {
  switch (settings.name) {
   // Replace with your home widget
    case Routes.loginPage:
      return MaterialPageRoute(builder: (_) => Auth());
      case Routes.Bottomnavbar:
      return MaterialPageRoute(builder: (_) =>  BottomNavbar()); // Replace with your home widget
    // Add more routes here as needed
    default:
      return MaterialPageRoute(
        builder:
            (_) => Scaffold(
              appBar: AppBar(title: Text('Unknown Route')),
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ),
      );
  }
}
