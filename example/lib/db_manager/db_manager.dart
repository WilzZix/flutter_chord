import 'dart:convert';

import 'package:example/model/lyrics.model.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseManager {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('Test/name');

  Future<Object?> readData() async {
    String? firebaseData;
    DatabaseEvent event = await ref.once();

    // ref.once("name").then((value) => null);
    // ref.onValue.listen((DatabaseEvent event) {
    //   final data1 = event.snapshot.value;
    //   firebaseData = data1 as String?;
    //   //  var data = json.decode(utf8.decode(data1));
    //   print("DATALYRICS $data1");
    // });
    return firebaseData = event.snapshot.value as String?;
  }

  Future<void> writeData(String lyrics) async {
    try {
      await ref.set({
        "name": lyrics,
      });
    } catch (e) {
      print(e);
    }
  }
}
