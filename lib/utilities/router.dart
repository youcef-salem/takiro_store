import 'package:flutter/material.dart';
import 'package:takiro_store/utilities/routes.dart';

import 'package:takiro_store/view/landing_page.dart';
import 'package:takiro_store/view/auth.dart';

Route<dynamic> ongenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.landingPage:
      return MaterialPageRoute(
        builder: (_) => LandingPage(),
      ); // Replace with your home widget
    case Routes.loginPage:
      return MaterialPageRoute(builder: (_) => Auth());
      
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
