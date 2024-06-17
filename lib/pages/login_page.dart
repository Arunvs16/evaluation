import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_eva/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // user login
  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          content: Text(
            'Invalid',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login Page"),
      ),
      backgroundColor: Colors.blue.shade400,
      body: Column(
        children: [
          // welcome text
          const Text("Login with your email and password"),

          const SizedBox(
            height: 40,
          ),

          // email text field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
          ),

          const SizedBox(
            height: 20,
          ),
          // password textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: false,
            ),
          ),

          const SizedBox(
            height: 40,
          ),
          // login button
          TextButton(onPressed: login, child: const Text('Login'))
        ],
      ),
    );
  }
}
