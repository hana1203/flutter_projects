import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      // ..setUserAgent('GREENDOTE_APP_WEBVIEW')
      ..loadRequest(
        Uri.parse('http://192.168.1.10:5173/phone-number'),
      );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      SafeArea(child: 
      WebViewWidget(
        controller: controller,
      ),
      )
    );
  }
}