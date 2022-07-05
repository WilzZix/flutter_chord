import 'dart:convert';

import 'package:example/model/lyrics.model.dart';
import 'package:firebase_database/firebase_database.dart';

class DataBaseManager {
  final DatabaseReference ref = FirebaseDatabase.instance.ref('test/RKSRTrVmPLoNwjfXsrsf');

  Future<void> readData() async {
    ref.onValue.listen((DatabaseEvent event) {
      final data1 = event.snapshot.value;
     // var data = json.decode(utf8.decode(data1));
    //  print("DATALYRICS $data");
    });
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
