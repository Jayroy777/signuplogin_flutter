import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signuplogin/providers/login_providers.dart';
import 'package:signuplogin/screens/signup.dart';
import 'package:form_validator/form_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> loginFormKey= GlobalKey<FormState>();
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final loginProvider= Provider.of<LoginProviders>(context,listen: false);
    debugPrint("Main Build");

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: loginFormKey,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 767),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  const Text("Please Login To Proceed"),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text("E-mail")),
                    validator: ValidationBuilder().email().build(),
                    controller: emailController,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        label: const Text("Password")),
                    validator: ValidationBuilder().minLength(6).build(),
                    controller: passwordController,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                          onPressed: () {
                            if(
                            loginFormKey.currentState?.validate()== true
                            ){
                              debugPrint("validated");
                              loginProvider.setEmail(emailController.text);
                              loginProvider.setPassword(passwordController.text);
                              loginProvider.sendLoginData(context);
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 20),
                          ))),
                  const SizedBox(height: 40),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const SignUp()));
                      },
                      child: const Text("Create New Account"))
                ]),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
