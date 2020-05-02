import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MakeList extends StatefulWidget {
  @override
  _MakeListState createState() => _MakeListState();
}

class _MakeListState extends State<MakeList> {

  List<User> userlist= [];
  String User_name;
  String User_email;

  final _firestore = Firestore.instance;

  Future PushToDb(User x) async {
    await _firestore.collection("Inviteelist")
        .add({
        'InviteeName'   : x.name,
      'InviteemailId' : x.email,
    });
  }

  Future<List<User>> _getuser() async {
    List<User> newUpdatesList = [];
    await for(var snapshot in _firestore.collection('Inviteelist').snapshots())
    {
      //print(snapshot.documents.length);
      for(var message in snapshot.documents)
      {
        String name,email;
        name = message.data['InviteeName']??'Message Text Unavailable';
        email = message.data['InviteemailId']??'Event Unavailable';
        newUpdatesList.add(User(name: name, email: email));
      }
      //print(newUpdatesList.length);
      return newUpdatesList;
    }
    return newUpdatesList;
  }

  Future adduser(User u) async{
     await PushToDb(u);
    setState(() {
    });
  }
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INVITEE LIST",style: TextStyle(fontSize: 25.0,letterSpacing: 2.0),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 10.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: 230.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[400],
              ),
            child: Form(
               child: Padding(
                 padding: const EdgeInsets.all(15.0),
                 child: Column(
                   children: <Widget>[
                     TextField(
                       controller: _controller1,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Name',
                         suffixIcon: IconButton(
                           onPressed: () => _controller1.clear(),
                           icon: Icon(Icons.clear),
                         ),
                       ),

                       onChanged: (text) {
                         setState(() {
                           User_name=text;
                         });
                       },
                     ),
                     SizedBox(height: 10.0,),
                     TextField(
                       controller: _controller2,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(),
                         labelText: 'Email',
                         suffixIcon: IconButton(
                           onPressed: () => _controller2.clear(),
                           icon: Icon(Icons.clear),
                         ),
                       ),
                       onChanged: (text) {
                         setState(() {
                           User_email=text;
                         });
                       },
                     ),
                     SizedBox(height: 10.0,),
                     RaisedButton.icon(
                         color:Theme.of(context).accentColor,
                         onPressed:() async {
                           String n=User_name,e=User_email;
                           if(n!=null && e!=null){
                             User x= User(name: n, email: e);
                             await adduser(x);
                             //print(n+" "+e);
                           }
                           _controller1.clear();
                           _controller2.clear();
                         },
                         icon:Icon(Icons.add),
                         label: Text("ADD AS INVITEE"),
                     )
                   ],
                 ),
               ),
            ),
            ),
          Expanded(
              child: Container(
                child: FutureBuilder(
                  future: _getuser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text("LOADING LIST...."),
                        ),
                      );
                    }
                    else {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int idx) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(snapshot.data[idx].name),
                                leading: Icon(Icons.done_outline),
                                subtitle: Text(snapshot.data[idx].email),
                              ),
                              Divider(thickness: 2.0,),
                            ],
                          );
                        },
                      );
                    }
                  }
                ),
              ),
          ),
        ],
      ),
    );
  }
}

class User{

  final String name;
  final String email;

  User({this.name,this.email});

  String get Name=>name;
  String get Email=>email;

}
