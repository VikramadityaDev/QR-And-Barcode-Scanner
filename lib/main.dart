import 'package:flutter/material.dart';
import 'package:web_view_app/scan_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner and Barcode Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey.shade900,
      ),
      debugShowCheckedModeBanner: false,
      home: ScannerPage(),
    );
  }
}
