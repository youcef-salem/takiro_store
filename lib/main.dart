import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/services/Auth.dart';
import 'package:takiro_store/utilities/router.dart';
import 'package:takiro_store/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,


        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.grey[600]),
            // Add these properties for error styling
            errorStyle: TextStyle(color: Colors.red, fontSize: 12),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.grey),
            ),

            // Existing properties
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Color(0xFFF9F9F9),
        ),

        initialRoute: Routes.landingPage,
        onGenerateRoute: ongenerateRoute,
      ),
    );
  }
}
