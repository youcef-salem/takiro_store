import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takiro_store/controlers/auth_conteroler.dart';
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
    super.dispose();
    email_controler.dispose();
    password_conteroler.dispose();
  }

  void _submitForm(auth_controler model) async {
    try {
      await model.submit();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.greenAccent,
            content: Text(
              'Success',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.black87),
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              e.toString(),
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
          ),
        );
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  final email_controler = TextEditingController();
  final password_conteroler = TextEditingController();

  final FocusNode password_node = FocusNode();
  final FocusNode email_node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Consumer<auth_controler>(
      builder: (_, model, __) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        model.type == Auth_Form_TYpe.login
                            ? "Login"
                            : "Register",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 60),

                      const SizedBox(height: 20),
                      TextFormField(
                        focusNode: email_node,
                        controller: email_controler,
                        onChanged: (value) => model.update_email(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          }
                          return null;
                        },
                        onEditingComplete:
                            () => FocusScope.of(context).nextFocus(),
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "enter your Email",
                          errorMaxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        focusNode: password_node,
                        onChanged: (value) => model.update_password(value),
                        controller: password_conteroler,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "enter your Password",
                          errorMaxLines: 2,
                        ),
                      ),
                      Visibility(
                        visible: model.type == Auth_Form_TYpe.login,
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
                          txt:
                              model.type == Auth_Form_TYpe.login
                                  ? "LOGIN "
                                  : "REGISTER",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint(
                                "Email: ${model.email}, Password: ${model.password}",
                              );
                              _submitForm(model);
                            }

                            // Handle login/register logic
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InkWell(
                            onTap: () {
                              _formKey.currentState!.reset();

                              model.togle_type();
                            },
                            child: Text(
                              model.type == Auth_Form_TYpe.login
                                  ? 'You don\'t have an account?'
                                  : 'You already have an account?',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          model.type == Auth_Form_TYpe.login
                              ? "Or login With"
                              : "Sign up With these platforms",
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
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
                              icon: const Icon(
                                Icons.facebook,
                                color: Colors.black,
                              ),
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
                              icon: const Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
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
      },
    );
  }
}
