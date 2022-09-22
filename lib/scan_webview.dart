import 'package:flutter/material.dart';
import 'package:web_view_app/screen/scan_page.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ScanWebview extends StatefulWidget {
  // const ScanWebview({Key? key}) : super(key: key);

  @override
  State<ScanWebview> createState() => _ScanWebviewState();
}

class _ScanWebviewState extends State<ScanWebview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ) ,
    );
  }
}
