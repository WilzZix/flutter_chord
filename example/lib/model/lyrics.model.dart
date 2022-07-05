import '../db_manager/db_manager.dart';

class Lyrics {
  final String name;

  Lyrics({required this.name});

  factory Lyrics.fromJson(Map<String, dynamic> json) => Lyrics(name: json['name']);
}

// class FirebaseApi {
//   Future<Lyrics> getLyrics() async {
//     DataBaseManager manager = DataBaseManager();
//
//     return manager.readData();
//   }
// }
