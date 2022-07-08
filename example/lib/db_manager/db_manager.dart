import 'dart:convert';

import 'package:example/model/lyrics.model.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseManager {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('test/RKSRTrVmPLoNwjfXsrsf/name');

  Future<String?> readData() async {
    String? firebaseData;
    // ref.once("name").then((value) => null);
    ref.onValue.listen((DatabaseEvent event) {
      final data1 = event.snapshot.value;
      firebaseData = data1 as String?;
      //  var data = json.decode(utf8.decode(data1));
      print("DATALYRICS $data1");
    });
    return firebaseData;
  }

  Future<void> writeData(String lyrics) async {
    try {
      await ref.set({
        "name": lyrics,
        "age": 18,
        "address": {"line1": "100 Mountain View"}
      });
    } catch (e) {
      print(e);
    }
  }
}
