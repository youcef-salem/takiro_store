import 'package:flutter/material.dart';
import 'package:takiro_store/model/product.dart';
import 'package:takiro_store/utilities/routes.dart';
import 'package:takiro_store/view/BototmNavbar.dart';


import 'package:takiro_store/view/auth.dart';
import 'package:takiro_store/view/landing_page.dart';
import 'package:takiro_store/view/product_details.dart';

Route<dynamic> ongenerateRoute(RouteSettings settings) {
  switch (settings.name) {
   // Replace with your home widget
    case Routes.loginPage:
      return MaterialPageRoute(builder: (_) => Auth(),
        settings: settings);
      case Routes.Bottomnavbar:
      return MaterialPageRoute(builder: (_) =>  BottomNavbar(),
        settings: settings); // Replace with your home widget
    // Add more routes here as needed
      case Routes.landingPage:
        return MaterialPageRoute(builder: (_) => Laanding_page(),
        settings: settings
        );
       case Routes.product_details:

  return MaterialPageRoute(
    builder: (_) => ProductDetails(
      pr: settings.arguments as Product,
    ),
    settings: settings,
  );
        // You can add more routes here as needed
       
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
