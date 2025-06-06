import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:takiro_store/utilities/enums.dart';
import 'package:takiro_store/widgets/mainbutton.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email_controler.dispose();
    password_conteroler.dispose();
    name_controler.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final email_controler = TextEditingController();
  final password_conteroler = TextEditingController();
  var Authtype = Auth_Form_TYpe.login;
  var to_Auth = true;
  final FocusNode password_node = FocusNode();
  final FocusNode email_node = FocusNode();
  final FocusNode name_node = FocusNode();
  final name_controler = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 30),
                  Text(
                    to_Auth ? "Login" : "Register",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 60),
                  Visibility(
                    visible: !to_Auth,
                    child: TextFormField(
                      focusNode: name_node,
                      controller: name_controler,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                      onEditingComplete:
                          () => FocusScope.of(context).requestFocus(email_node),
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "enter your Name",
                        errorMaxLines: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    focusNode: email_node,
                    controller: email_controler,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "enter your Email",
                      errorMaxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    focusNode: password_node,
                    controller: password_conteroler,
                    obscureText: true, // Hide password
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "enter your Password",
                      errorMaxLines: 2,
                    ),
                  ),

                  Visibility(
                    visible: to_Auth,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          child: const Text("Forgot Your Password?"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: Mainbutton(
                      txt: to_Auth ? "LOGIN " : "REGISTER",

                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle login logic
                          Navigator.pushNamed(context, '/Bottomnavbar');
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        onTap:
                            () => {
                              _formKey.currentState!.reset(),
                              email_controler.clear(),
                              password_conteroler.clear(),
                              name_controler.clear(),
                              setState(() {
                                if (Authtype == Auth_Form_TYpe.login) {
                                  Authtype = Auth_Form_TYpe.register;
                                  to_Auth = false;
                                } else {
                                  Authtype = Auth_Form_TYpe.login;
                                  to_Auth = true;
                                }
                              }),
                            },

                        child: Text(
                          to_Auth
                              ? 'You d\'ont have an acount ?'
                              : " You have Already  an acount ?",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      to_Auth
                          ? "Or login  With"
                          : " Sign  up  With this platforms ",
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
                            // Handle Facebook Auth
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
                            // Handle Google Auth
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
