// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// class Scanner extends StatefulWidget {
//   @override
//   _ScannerState createState() => _ScannerState();
// }

// class _ScannerState extends State<Scanner> {
//   String _scanBarcode = 'Unknown';

//   String? barcodeScanRes;

//   @override
//   void initState() {
//     super.initState();
//   }

//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//             '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String? barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() => this.barcodeScanRes = barcodeScanRes);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: const Text('Barcode scan')),
//             body: Builder(builder: (BuildContext context) {
//               return Container(
//                   alignment: Alignment.center,
//                   child: Flex(
//                       direction: Axis.vertical,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ElevatedButton(
//                             onPressed: () => scanBarcodeNormal(),
//                             child: Text('Start barcode scan')),
//                         ElevatedButton(
//                             onPressed: () => startBarcodeScanStream(),
//                             child: Text('Start barcode scan stream')),
//                         Text('Scan result : $_scanBarcode\n',
//                             style: TextStyle(fontSize: 20))
//                       ]));
//             })));
//   }
// }
