import 'package:flutter/material.dart';
import 'package:spotify/screen/player_screen.dart';
import 'package:spotify/screen/playlistLibrary_screen.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlayListLibraryScreen(),
              ),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   width: 30,
            // ),
            Image.asset(
              'assets/images/logo.png',
              scale: 10,
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.pink,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(1),
                      ])),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Image.network(
                        songs[0].image,
                        width: MediaQuery.of(context).size.width - 140,
                        height: MediaQuery.of(context).size.width - 120,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              songs[0].album,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              children: [
                                Image(
                                  image: AssetImage("assets/images/logo.png"),
                                  height: 72,
                                  width: 72,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 600,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, idx) {
                      return displayList(songs[idx], idx, songs);
                    },
                    separatorBuilder: (context, idx) => const Divider(),
                    itemCount: songs.length,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget displayList(Song song, int idx, List<Song> snapshot) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(" ${idx + 1}"),
      ),
      title: Text(
        song.title,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        song.artist,
        style: const TextStyle(color: Colors.white),
      ),
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
