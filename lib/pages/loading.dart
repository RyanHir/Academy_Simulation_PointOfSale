import 'package:flutter/material.dart';
import 'package:pos_system/consts.dart';

class Loading extends StatelessWidget {
  final String title;
  Loading({this.title = TITLE});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$TITLE: Loading")),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class LoadingDialog {
  static Future<void> showLoading(BuildContext context, GlobalKey key,
      {String message = ""}) async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            key: key,
            title:
                (message == null || message.isNotEmpty) ? Text(message) : null,
            children: [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          ),
        );
      },
    );
  }
}
