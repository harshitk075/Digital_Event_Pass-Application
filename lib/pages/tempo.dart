import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
class Temporaryscreen extends StatefulWidget {
  @override
  _TemporaryscreenState createState() => _TemporaryscreenState();
}

class _TemporaryscreenState extends State<Temporaryscreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          onPressed: sendemail,
          child: Text("Send email"),
        ),
      ),
    );
  }

  Future<void> sendemail() async  {
  List<String> recipients = new List();
  recipients.add("iit2018075@iiita.ac.in");
  recipients.add("iit2018074@iiita.ac.in");
  recipients.add("iit2018073@iiita.ac.in");
  final Email email = Email(
    body: "blah blah blah",
    subject: "email sender check",
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
}

