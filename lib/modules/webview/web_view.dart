import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebView extends StatelessWidget {
  const WebView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    var controller =WebViewController();
    return Scaffold(
      body: FutureBuilder(
          future: controller.loadRequest(Uri.parse(url)),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            return WebViewWidget(controller: controller);
          }),
    );
  }
}
