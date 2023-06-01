// ignore: file_names

import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:spotify/db/constant.dart';

class MongoDatabase {
  static var db, songCollection;
  static connect() async {
    db = await Db.create(MONGO_DB_URL);
    await db.open();
    inspect(db);
    songCollection = db.collection(SONGS_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await songCollection.find().toList();
    return arrData;
  }
}
