import 'package:flutter/material.dart';

class ErrorRetryWidget extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const ErrorRetryWidget(
      {Key key, @required this.error, @required this.onRetry})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          error,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        FlatButton(
          onPressed: onRetry,
          child: Text(
            'Try Again',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ));
  }
}
