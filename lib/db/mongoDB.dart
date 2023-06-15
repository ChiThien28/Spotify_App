// ignore: file_names

import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:spotify/db/constant.dart';

import '../model/song.dart';

class MongoDatabase {
  static var songCollection;
  static connect() async {
    final db = await Db.create(MONGO_DB_URL);
    await db.open();
    inspect(db);
    songCollection = db.collection(SONGS_COLLECTION);
  }

  static Future<List<Song>> getData() async {
    final arrData = await songCollection.find().toList();
    final songList = arrData.map<Song>((data) => Song.fromJson(data)).toList();
    return songList;
  }

  static Future<List<Song>> getDataByAlbum(albumName) async {
    final arrData = await songCollection.find({'album': albumName}).toList();
    final songList = arrData.map<Song>((data) => Song.fromJson(data)).toList();
    return songList;
  }
}
