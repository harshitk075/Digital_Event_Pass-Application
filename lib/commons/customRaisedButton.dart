import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  String label;
  bool inProgress;
  VoidCallback onPressed;
  double height, minWidth;
  CustomRaisedButton(
      {this.label,
      this.inProgress = false,
      this.height,
      this.minWidth,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      minWidth: minWidth,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        color: Theme.of(context).primaryColor,
        child: inProgress
            ? CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xfff5f5f5)),
              )
            : Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(width:1.0, color:Colors.white)
                    )  
                  ),
                  child: Icon(Icons.add)
                ),
                Text(
                    '$label',
                    style: TextStyle(color: Colors.white),
                  ),
              ],
            ),
        onPressed: onPressed,
      ),
    );
  }
}
