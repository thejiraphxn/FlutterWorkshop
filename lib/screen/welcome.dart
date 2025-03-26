import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var uid;

    return Scaffold(
      appBar: AppBar(
        title: Text("SMK+ DATABASE"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(children: [
            Text(
              auth.currentUser()!.uid,
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              child: Text("Log out"),
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                });
              },
            )
          ]),
        ),
      ),
    );
  }
}
