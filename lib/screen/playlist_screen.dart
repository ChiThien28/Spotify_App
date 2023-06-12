import 'package:flutter/material.dart';
import 'package:spotify/screen/player_screen.dart';

import '../db/mongoDB.dart';
import '../model/song.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  late Future<List<Song>> albumList;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    albumList = MongoDatabase.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo Text Api Flutter"),
        ),
        body: FutureBuilder(
            future: albumList,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  var totalData = snapshot.data.length;
                  // ignore: avoid_print
                  print("Total Data: $totalData");
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, idx) {
                      return displayList(
                          snapshot.data[idx], idx, snapshot.data);
                    },
                    separatorBuilder: (context, idx) => const Divider(),
                    itemCount: snapshot.data.length,
                  );
                } else {
                  return const Center(
                    child: Text("No data Available."),
                  );
                }
              }
            }));
  }

  Widget displayList(Song song, int idx, List<Song> snapshot) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(idx.toString()),
      ),
      title: Text(song.title),
      subtitle: Text(song.artist),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PlayerScreen(
                    song: snapshot,
                    index: idx,
                  )),
        );
      },
    );
  }
}
