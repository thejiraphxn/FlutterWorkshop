import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screen/barcode.dart';
import 'package:flutter_application_1/screen/register.dart';
import 'package:flutter_application_1/screen/login.dart';
import 'checker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMKCONNECT PLUS+"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset("assets/images/smk.png"),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                },
                icon: Icon(Icons.add),
                label:
                    Text("Create New Account", style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                icon: Icon(Icons.login),
                label: Text("Login", style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DatabaseInclude();
                  }));
                },
                icon: Icon(Icons.check),
                label: Text("Database Checker", style: TextStyle(fontSize: 20)),
              ),
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton.icon(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return BarcodeScanner();
            //       }));
            //     },
            //     icon: Icon(Icons.qr_code_scanner),
            //     label: Text("Barcode Scanner", style: TextStyle(fontSize: 20)),
            //   ),
            // )
          ]),
        ),
      ),
    );
  }
}
