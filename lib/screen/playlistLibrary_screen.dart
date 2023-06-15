import 'package:flutter/material.dart';
import 'package:spotify/screen/home_spotify.dart';
import 'package:spotify/screen/playlist_screen.dart';

import '../db/mongoDB.dart';
import '../model/song.dart';

class PlayListLibraryScreen extends StatefulWidget {
  const PlayListLibraryScreen({super.key});

  @override
  State<PlayListLibraryScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListLibraryScreen> {
  void navigateToPlayListScreen(BuildContext context, List<Song> albumSongs) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayListScreen(
          album: albumSongs,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   width: 45,
            // ),
            Text(
              'AlbumList',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Scrollbar(
        thickness: 5,
        radius: const Radius.circular(5),
        child: GridView.count(
          mainAxisSpacing: 30,
          crossAxisSpacing: 15,
          crossAxisCount: 2,
          children: [
            Container(
              child: GestureDetector(
                onTap: () async {
                  const albumName =
                      'Wake Up'; // Replace with the actual album name
                  final albumSongs =
                      await MongoDatabase.getDataByAlbum(albumName);
                  navigateToPlayListScreen(context, albumSongs);
                },
                child: Image.network(
                  "https://storage.googleapis.com/uamp/The_Kyoto_Connection_-_Wake_Up/art.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () async {
                  const albumName =
                      'Jazz & Blues'; // Replace with the actual album name
                  final albumSongs =
                      await MongoDatabase.getDataByAlbum(albumName);
                  navigateToPlayListScreen(context, albumSongs);
                },
                child: Image.network(
                  "https://storage.googleapis.com/automotive-media/album_art.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () async {
                  const albumName =
                      'Cinematic'; // Replace with the actual album name
                  final albumSongs =
                      await MongoDatabase.getDataByAlbum(albumName);
                  navigateToPlayListScreen(context, albumSongs);
                },
                child: Image.network(
                  "https://storage.googleapis.com/automotive-media/album_art.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () async {
                  const albumName =
                      "Youtube Audio Library Rock"; // Replace with the actual album name
                  final albumSongs =
                      await MongoDatabase.getDataByAlbum(albumName);
                  navigateToPlayListScreen(context, albumSongs);
                },
                child: Image.network(
                  "https://storage.googleapis.com/automotive-media/album_art_2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () async {
                  const albumName =
                      "Youtube Audio Library Rock 2"; // Replace with the actual album name
                  final albumSongs =
                      await MongoDatabase.getDataByAlbum(albumName);
                  navigateToPlayListScreen(context, albumSongs);
                },
                child: Image.network(
                  "https://storage.googleapis.com/automotive-media/album_art_3.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: GestureDetector(
                onTap: () async {
                  const albumName =
                      "Spatial Audio"; // Replace with the actual album name
                  final albumSongs =
                      await MongoDatabase.getDataByAlbum(albumName);
                  navigateToPlayListScreen(context, albumSongs);
                },
                child: Image.network(
                  "https://storage.googleapis.com/uamp/Spatial Audio/Marching band.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            child:  IconButton(
              
              onPressed: () => {
                print("Home"),
                Navigator.push(context, MaterialPageRoute(
                              builder: (build) => const Spotify()))
                
            }
            ,icon: Icon(Icons.home_outlined,color: Color.fromARGB(255, 10, 127, 14,),size: 40)
            ),
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 57, 57)
            ),
          ),
          Container(
            child:  IconButton(
              
              onPressed: () => {
                print("Libary"),
                Navigator.push(context, MaterialPageRoute(
                              builder: (build) => const PlayListLibraryScreen()))
                
            }
            ,icon: Icon(Icons.library_music_outlined,color: Color.fromARGB(255, 10, 127, 14,),size: 40)
            ),
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 57, 57)
            ),
          ),
           Container(
            child: Icon(Icons.access_time, color: Color.fromARGB(255, 10, 127, 14),size: 40,),
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 57, 57)
            ),
          ),
           Container(
            child: Icon(Icons.person_2_outlined, color: Color.fromARGB(255, 10, 127, 14),size: 40,),
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 58, 57, 57)
            ),
          ),
        ],
      ),
    );
  }
}
