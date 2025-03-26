import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../model/profile.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Create New Account"),
              ),
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Please enter your email"),
                              EmailValidator(
                                  errorText: "Your email cannot use"),
                            ]),
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (var email) {
                              profile.email = email;
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Password", style: TextStyle(fontSize: 20)),
                          TextFormField(
                            validator: RequiredValidator(
                                errorText: "Please enter your password"),
                            obscureText: true,
                            onSaved: (var password) {
                              profile.password = password;
                            },
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              child: Text(
                                "Register",
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState?.save();
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: profile.email,
                                            password: profile.password)
                                        .then((value) {
                                      Fluttertoast.showToast(
                                          msg: "Your account created!",
                                          gravity: ToastGravity.CENTER);
                                      formKey.currentState?.reset();
                                    });
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return HomeScreen();
                                    }));
                                  } on FirebaseAuthException catch (e) {
                                    Fluttertoast.showToast(
                                        msg: "${e.message}",
                                        gravity: ToastGravity.CENTER);
                                    // print(e.message);
                                    // print(e.code);
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}


                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Text("Username", style: TextStyle(fontSize: 20)),
                          // TextFormField(
                          //   validator: MultiValidator([
                          //     RequiredValidator(
                          //         errorText: "Please enter your username"),
                          //   ]),
                          //   onSaved: (var username) {
                          //     profile.username = username;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Text("Firstname", style: TextStyle(fontSize: 20)),
                          // TextFormField(
                          //   validator: RequiredValidator(
                          //       errorText: "Please enter your firstname"),
                          //   onSaved: (var firstname) {
                          //     profile.firstname = firstname;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Text("Lastname", style: TextStyle(fontSize: 20)),
                          // TextFormField(
                          //   validator: RequiredValidator(
                          //       errorText: "Please enter your lastname"),
                          //   onSaved: (var lastname) {
                          //     profile.lastname = lastname;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Text("Phone", style: TextStyle(fontSize: 20)),
                          // TextFormField(
                          //   validator: RequiredValidator(
                          //       errorText: "Please enter your phone number"),
                          //   keyboardType: TextInputType.phone,
                          //   onSaved: (var phone) {
                          //     profile.phone = phone;
                          //   },
                          // ),