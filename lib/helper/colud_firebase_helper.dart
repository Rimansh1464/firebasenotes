import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFireStoreHelper{
  CloudFireStoreHelper._();

  static final CloudFireStoreHelper cloudFireStoreHelper = CloudFireStoreHelper._();

  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference employee = FirebaseFirestore.instance.collection('employee');
  CollectionReference note = FirebaseFirestore.instance.collection('note');
 // CollectionReference Counter = FirebaseFirestore.instance.collection('counter');

  //TODO : insertData
  insertData({required String title,required String notes,required id})async{
    await note.doc(id).set({'title' :title,'note': notes});

  }
  //TODO : fetchData
  Stream<QuerySnapshot> fetchData(){
      Stream<QuerySnapshot> stream = note.snapshots();
      //Stream<QuerySnapshot> Counterstream = Counter.snapshots();
      return stream;
   }
//TODO : deleteData
  deleteData({required id })async{
    await note.doc(id).delete();

  }
}