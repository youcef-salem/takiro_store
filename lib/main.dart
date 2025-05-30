import 'package:flutter/material.dart';
import 'package:takiro_store/utilities/router.dart';
import 'package:takiro_store/utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Takiro ',

      theme: ThemeData(
        
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.labelLarge,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder:   OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
      
      ),

      initialRoute: Routes.loginPage,
      onGenerateRoute: ongenerateRoute,
    );
  }
}
