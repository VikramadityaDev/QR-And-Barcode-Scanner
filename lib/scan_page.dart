import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:web_view_app/Barcode_webview.dart';
import 'package:web_view_app/QR_webview.dart';

var url;
var BarcodeLink;

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  var getResult = 'QR Code Result';
  var get_BARCODE_Result = 'BARCODE Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner/Barcode'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              scanQRCode();
            },
            child: Text('Scan QR'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              scanBARCODECode();
            },
            child: Text('Scan Barcode'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(getResult),
          SizedBox(
            height: 10,
          ),
          Text(get_BARCODE_Result),
        ],
      )),
    );
  }

  // QR SCANNER

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
        url = qrCode.trim();
        if (url != '-1') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => QRWebview()));
        }
      });
      print("QRCode_Result:");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }

  //BARCODE READER

  void scanBARCODECode() async {
    try {
      final BarCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);

      if (!mounted) return;

      setState(() {
        get_BARCODE_Result = BarCode;
        BarcodeLink = BarCode.trim();
        if (BarcodeLink != '-1') {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => BarCodeWebview()));
        }
      });
      print("QRCode_Result:");
      print(BarCode);
    } on PlatformException {
      get_BARCODE_Result = 'Failed to scan QR Code.';
    }
  }
}
