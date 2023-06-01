import 'package:flutter/material.dart';
import 'package:spotify/screen/player_screen.dart';
import 'package:spotify/screen/playlistLibrary_screen.dart';

import '../db/mongoDB.dart';
import '../model/song.dart';
import 'home_spotify.dart';

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
      body: Stack(
        children: [
          Container(
            color: Colors.pink,
          ),
          Positioned(
          left: 15.0,
          top: 40.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Spotify()),
              );
            },
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                primary: Colors.black,
                padding: const EdgeInsets.all(8.0)),
                
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20.0,
            ),
          ),
        ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
                      ]
                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      Image(
    
                      image: AssetImage("assets/images/taylor.jpg"),
                      width: MediaQuery.of(context).size.width - 140,
                      height: MediaQuery.of(context).size.width - 120,
                      fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text("Album",
                            style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                            
                            ),
                            Row(
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
                        child: Text("No data Available.", style: TextStyle(color: Colors.white),),
                        
                      );
                    }
                  }
                }),
                ),
                
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            child: Icon(Icons.home_outlined, color: Color.fromARGB(255, 10, 127, 14),size: 40,),
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

  Widget displayList(Song song, int idx, List<Map<String, Object?>> snapshot) {
    return ListTile(
      // shape: RoundedRectangleBorder(
      //           side: const BorderSide(color: Colors.white, width: 4),
      //           borderRadius: BorderRadius.circular(15),
      //         ),
      leading: CircleAvatar(
        child: Text(idx.toString()),
      ),
      title: Text(song.title, style: TextStyle(color: Colors.white),),
      subtitle: Text(song.artist, style: TextStyle(color: Colors.white),),
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
