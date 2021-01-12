import 'package:digitaleventpass/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaleventpass/pages/display_event.dart';

final _firestore = Firestore.instance;
String currentInviteeCode;
Future<String>  registerUser(String orgID, String eventID) async{
//  print(orgID);
//  print(eventID);
  await _firestore.collection("OrganizerContainer").document(orgID).collection("Events").document(eventID).collection('Inviteelist')
      .add({
    'InviteeName' : name,
    'InviteemailId' : email,
    'Timestamp'  : null,
    'isverified' :  false,
  }).then((value) =>  currentInviteeCode=value.documentID);
  return currentInviteeCode;
}
