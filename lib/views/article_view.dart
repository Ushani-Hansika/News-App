import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticalView extends StatefulWidget {
  final String blogURL;
  ArticalView({this.blogURL});

  @override
  _ArticalViewState createState() => _ArticalViewState();
}

class _ArticalViewState extends State<ArticalView> {

final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" The Guardian",  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            Text(" News" , style: TextStyle(
              color: Colors.white,

            ),),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogURL,
          onWebViewCreated: ((WebViewController webViewControler){
            _completer.complete(webViewControler);
          }),
        ),
      ),
    );
  }
}
