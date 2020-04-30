import 'package:digitaleventpass/post_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  Future<Post> FuncEvent(String ID) async{
  final databaseReference = Firestore.instance;
    DocumentReference documentReference =
    databaseReference.collection("events").document(ID);
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        //temp = datasnapshot.data['eventname'];
        //Post obj = Post()
      }
      else {
        print("No such user");
      }
    });
  }