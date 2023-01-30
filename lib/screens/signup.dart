import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:signuplogin/providers/signup_providers.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> signUpFormKey= GlobalKey<FormState>();
  TextEditingController nameController =  TextEditingController();
  TextEditingController phoneController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController addressController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();

@override
  void dispose() {
    // TODO: implement dispose
  nameController.dispose();
  phoneController.dispose();
  emailController.dispose();
  addressController.dispose();
  passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final signUpProvider = Provider.of<SignUpProviders>(context);
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: signUpFormKey,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 767),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      const Text("Registration"),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            label: const Text("Name")),
                        validator: ValidationBuilder().minLength(3).build(),
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            label: const Text("Phone")),
                        validator: ValidationBuilder().phone().build(),
                          controller:phoneController
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            label: const Text("E-mail")),
                        validator: ValidationBuilder().email().build(),
                          controller:emailController
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            label: const Text("Address")),
                        validator: ValidationBuilder().minLength(5).build(),
                        controller: addressController,
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
                                if(signUpFormKey.currentState!.validate()==true){
                                  signUpProvider.setName(nameController.text);
                                  signUpProvider.setPhone(phoneController.text);
                                  signUpProvider.setEmail(emailController.text);
                                  signUpProvider.setAddress(addressController.text);
                                  signUpProvider.setPassword(passwordController.text);
                                  signUpProvider.signUp(context);
                                }
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 20),
                              ))),
                      const SizedBox(height: 40),
                      OutlinedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: const Text("Go to Login Page"))
                    ]),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
