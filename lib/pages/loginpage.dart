import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/loginback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
         backgroundColor: Colors.transparent,
         body: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                    Text(
                        "LOGIN",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           letterSpacing: 3.0,
                           fontSize: 40.0,
                           color: Colors.white,
                         ),
                    ),

                   SizedBox(height: 40.0),
                   Padding(
                     padding: const EdgeInsets.all(15.0),
                     child: Container(
                       child: Column(
                         children: <Widget>[
                           TextFormField(
                             decoration: const InputDecoration(
                               icon: const Icon(Icons.email),
                               hintText: 'Enter Registered Email',
                               labelText: 'E- mail',
                             ),
                           ),
                           TextFormField(
                             decoration: const InputDecoration(
                               icon: const Icon(Icons.edit),
                               hintText: 'Enter Password',
                               labelText: 'Password',
                             ),
                           ),
                           SizedBox(height: 30.0),
                           RaisedButton.icon(
                               onPressed: (){},
                                icon: Icon(Icons.subdirectory_arrow_right),
                               label: Text("Login"),
                               color: Colors.orangeAccent,
                               colorBrightness: Brightness.dark,
                           ),
                           SizedBox(height: 10.0),
                           Text("New User register here !!!"),
                         ],
                       ),
                     ),
                   )
                 ],
               ),
         ),
    );
  }
}
