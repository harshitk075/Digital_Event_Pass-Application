import 'package:flutter/material.dart';

class eventCreator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var borderSide = BorderSide();
    return Scaffold(
      backgroundColor: Color(0xFF80D8FF),
      body: Center(
        child: Card(
          child: Container(
            height: 350,
            width: 300,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 80,
                    width:100,
                    child:Center(
                      child: Text("LogIn",style: TextStyle(color: Color(0xFF40C4FF), fontSize: 35.0),
                      ),
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right:10.0),
                  child: Container(child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight:FontWeight.bold),
                      fillColor: Color(0xFFE0F7FA),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Color(0xFFE0F7FA),
                        )
                      ),
                      hintText: 'UserName',
                      icon: Icon(Icons.supervised_user_circle)
                    ),
                  ),
                  height: 50,
                  width: 250,),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, right:10.0),
                  child: Container(child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight:FontWeight.bold),
                      fillColor: Color(0xFFE0F7FA),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color:Color(0xFFE0F7FA),
                        )
                      ),
                      hintText: 'Password',
                      icon: Icon(Icons.security)
                    ),
                    obscureText: true
                  ),
                  height: 50,
                  width: 250,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 40,
                    width:80,
                    child: RaisedButton(
                      color: Color(0xFF009688),
                      onPressed: () {},
                      child: Text("Log In",style:TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500),),
                    ),
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}