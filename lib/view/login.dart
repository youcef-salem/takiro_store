import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takiro_store/widgets/mainbutton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final email_controler = TextEditingController();
    final password_conteroler = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 40),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 60),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      return null;
                    },
                    controller: email_controler,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "enter your Email ",
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password_conteroler,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "enter your Password  ",
                    ),
                  ),

                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        child: const Text("Forgot Your Password?"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: Mainbutton(txt: "LOGIN", onPressed: () => {}),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap:
                            () => {
                              
                              Navigator.pushNamed(context, '/register')},

                        child: const Text('You d\'ont have an acount ?'),
                      ),
                    ),
                  ),
                  SizedBox(height: 120),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Or Login With",
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.facebook, color: Colors.black),
                          onPressed: () {
                            // Handle Facebook login
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.email, color: Colors.black),
                          onPressed: () {
                            // Handle Google login
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
