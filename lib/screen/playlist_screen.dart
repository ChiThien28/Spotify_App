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
      appBar: AppBar(
        actions: <Widget>[
        IconButton(
          icon: Icon(
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
                       const SizedBox(height: 40,),
                      Image(
    
                      image: const  AssetImage("assets/images/tokyo.jpg"),
                      width: MediaQuery.of(context).size.width - 140,
                      height: MediaQuery.of(context).size.width - 120,
                      fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                             const Text("The Tokyo Connection",
                          
                            style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
                            
                            ),
                            Row(
                              children: const  [
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
                        padding: const EdgeInsets.all(6),
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
            decoration: const  BoxDecoration(
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
            decoration: const  BoxDecoration(
              color: Color.fromARGB(255, 58, 57, 57)
            ),
          ),
           Container(
            child: Icon(Icons.access_time, color: Color.fromARGB(255, 10, 127, 14),size: 40,),
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration: const  BoxDecoration(
              color: Color.fromARGB(255, 58, 57, 57)
            ),
          ),
           Container(
            child: const  Icon(Icons.person_2_outlined, color: Color.fromARGB(255, 10, 127, 14),size: 40,),
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration: const  BoxDecoration(
              color: Color.fromARGB(255, 58, 57, 57)
            ),
          ),
        ],
      ),
    );
  }

  Widget displayList(Song song, int idx, List<Map<String, Object?>> snapshot) {
    return Card(
      
        shape: RoundedRectangleBorder(
              side: BorderSide(color: Color.fromARGB(255, 33, 33, 33),width: 2),
              borderRadius: BorderRadius.circular(20)
           ),
      child: ListTile(
        tileColor: Colors.black,
        
        leading: CircleAvatar(
         
          child: Text(idx.toString()),
        ),
        title: Text(song.title, style: const TextStyle(color: Colors.white),),
        subtitle: Text(song.artist, style: const  TextStyle(color: Colors.white),),
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
        
      ),
    );
  }
}
