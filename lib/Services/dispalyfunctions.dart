import 'package:digitaleventpass/post_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  Future<Post> FuncEvent(String ID) async{
  final databaseReference = Firestore.instance;
    DocumentReference documentReference =
    databaseReference.collection("events").document(ID);
    Post obj;
    await documentReference.get().then((datasnapshot) {

      String Id= ID;
      String ename=  datasnapshot.data['eventname'];
      String evenue = datasnapshot.data['eventvenue'];
      double dur= datasnapshot.data['eventduration'];
      String des= datasnapshot.data['eventdescription'];
      String etype= datasnapshot.data['eventtype'];
      String eurl= datasnapshot.data['imageurl'];
      obj = Post(Id,ename,evenue,etype,dur,des,eurl);
    });
    return obj;
  }