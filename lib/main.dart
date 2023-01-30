import 'package:flutter/material.dart';
import 'package:signuplogin/providers/login_providers.dart';
import 'package:signuplogin/providers/signup_providers.dart';
import 'package:signuplogin/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProviders()),
        ChangeNotifierProvider(create: (context)=>SignUpProviders())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const Login(),
      ),
    );
  }
}
