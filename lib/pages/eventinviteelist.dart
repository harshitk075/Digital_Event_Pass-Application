import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:digitaleventpass/globals.dart';
import 'package:digitaleventpass/pages/home.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MakeList extends StatefulWidget {
  @override
  _MakeListState createState() => _MakeListState();
}

class _MakeListState extends State<MakeList> {

  List<User> userlist= [];
  String User_name;
  String User_email;

  final _firestore = Firestore.instance;
  String currentInviteeCode;

  Future PushToDb(User x,String IDevent) async {
    await _firestore.collection("OrganizerContainer").document(home.getUid()).collection("Events").document(IDevent).collection('Inviteelist')
        .add({
        'InviteeName' : x.name,
        'InviteemailId' : x.email,
        'Timestamp'   : null,
        'isverified' :  false,
    }).then((value) =>  currentInviteeCode=value.documentID);
  }

  Future<List<User>> _getuser(String ID) async {
    List<User> newUpdatesList = [];
    await for(var snapshot in _firestore.collection('OrganizerContainer').document(home.getUid() ).collection("Events").
    document(ID).collection('Inviteelist').snapshots())
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

  // mailsend utility
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<void> sendemail(User u) async  {
    String name= u.name;
    String mailID=u.email;

    List<String> recipients = new List();
    recipients.add(mailID);
    final Email email = Email(
      body: "Hey $name you are cordially invited to my event.Here is your UniqueID to get entry $currentInviteeCode",
      subject: "Invitation to my Event",
      recipients: recipients,
      isHTML: false,
    );
    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }


  Future adduser(User u,String IDorg) async{
     await PushToDb(u,IDorg);
     await sendemail(u);
    setState(() {
    });
  }
  var _controller1 = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Map data = ModalRoute.of(context).settings.arguments;
    String ID = data['ID'];
    print(ID);
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
                             await adduser(x,ID);
                              setState(() {
                                User_name=null;
                                User_email=null;
                                _controller1.clear();
                                _controller2.clear();
                              });
                             //print(n+" "+e);
                           }
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
                  future: _getuser(ID),
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
