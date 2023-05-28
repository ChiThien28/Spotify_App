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
  List<dynamic> posts = [];
  @override
  Widget build(BuildContext context) {
    // fetchPost();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo Text Api Flutter"),
        ),
        body: SafeArea(
            child: FutureBuilder(
                future: MongoDatabase.getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totalData = snapshot.data.length;
                      print("Total Data" + totalData.toString());
                      return ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, idx) {
                          return displayList(Song.fromJson(snapshot.data[idx]),
                              idx, snapshot.data);
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
                })));
  }

  Widget displayList(Song song, int idx, List<Map<String, Object?>> snapshot) {
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
