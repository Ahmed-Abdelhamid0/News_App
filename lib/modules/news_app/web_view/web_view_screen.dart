import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  WebViewScreen({required this.url});


  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
   final String url;


}

class _WebViewScreenState extends State<WebViewScreen> {

   WebViewController? controller;

   @override
   void initState()
   {
     controller=WebViewController()..loadRequest(Uri.parse(widget.url));
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(),
        body:WebViewWidget(
          controller:  controller!,
        ),

    );
  }
}
