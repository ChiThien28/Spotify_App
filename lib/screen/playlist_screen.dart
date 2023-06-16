import 'package:flutter/material.dart';
import 'package:spotify/screen/player_screen.dart';

import '../db/mongoDB.dart';
import '../model/song.dart';

class PlayListScreen extends StatefulWidget {
  final List<Song> album;
  PlayListScreen({super.key, required this.album});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  late List<Song> songs;

  @override
  void initState() {
    super.initState();
    songs = widget.album;
    // _initializeData();
  }

  // Future<void> _initializeData() async {
  //   albumList = MongoDatabase.getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo Text Api Flutter"),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, idx) {
            return displayList(songs[idx], idx, songs);
          },
          separatorBuilder: (context, idx) => const Divider(),
          itemCount: songs.length,
        ));
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
