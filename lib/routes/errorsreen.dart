import 'package:flutter/material.dart';
class Errorscreen extends StatefulWidget {
  final String errormessage;
  Errorscreen(this.errormessage);
  @override
  _ErrorscreenState createState() => _ErrorscreenState();
}

class _ErrorscreenState extends State<Errorscreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.errormessage),
          RaisedButton(
            child: Text("Retry"),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}