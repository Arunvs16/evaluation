import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Home Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
                "Welcome, You logged with ${FirebaseAuth.instance.currentUser?.email}"),
          ),
          const SizedBox(
            height: 30,
          ),
          // logout button
          ElevatedButton(
            onPressed: logout,
            child: const Text("Logout"),
          )
        ],
      ),
    );
  }
}
