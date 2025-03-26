// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/screen/barcode_scanner.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'barcode_scanner.dart';

// class BarcodeScanner extends StatefulWidget {
//   const BarcodeScanner({Key? key}) : super(key: key);

//   @override
//   State<BarcodeScanner> createState() => _BarcodeScannerState();
// }

// class _BarcodeScannerState extends State<BarcodeScanner> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Container(
//           child: Column(
//             children: [
//               Text("Barcode Scanner"),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return Scanner();
//                 }));
//               },
//               child: Icon(
//                 Icons.qr_code,
//                 color: Colors.white,
//               ))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Card(
//           child: Container(),
//         ),
//       ),
//     );
//   }
// }
