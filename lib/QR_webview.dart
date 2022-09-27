import 'package:flutter/material.dart';
import 'package:web_view_app/scan_page.dart';
import 'package:webview_flutter/webview_flutter.dart';


class QRWebview extends StatefulWidget {

  @override
  State<QRWebview> createState() => _QRWebviewState();
}

class _QRWebviewState extends State<QRWebview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(                   //Webview Of scanned QR with in the app ! is'nt cool ? 
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ) ,
    );
  }
}
