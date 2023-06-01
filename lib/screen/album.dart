import 'package:flutter/material.dart';
import 'package:spotify/screen/home_spotify.dart';
import 'package:spotify/screen/playlistLibrary_screen.dart';
class AlbumSong extends StatefulWidget {
  const AlbumSong({super.key});

  @override
  State<AlbumSong> createState() => _AlbumSongState();
}

class _AlbumSongState extends State<AlbumSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      SizedBox(height: 40,),
                      Image(
                      image: AssetImage("assets/images/taylor.jpg"),
                      width: MediaQuery.of(context).size.width - 120,
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
                  child: Column(
                    children: [
                  ListTile(
                    onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => Spotify()));
                          },
                    leading: CircleAvatar(child: Image.asset('assets/images/billie.jpg'),),
                    title: Text('Bad Guy',style: TextStyle(color: Colors.white),),
                    subtitle: Text('Billie Eilish',style: TextStyle(color: Colors.white),),
                  ),
                  ListTile(
                    onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => Spotify()));
                          },
                    leading: CircleAvatar(child: Image.asset('assets/images/theweeknd.jpg'),),
                    title: Text('Blinding Lights',style: TextStyle(color: Colors.white),),
                    subtitle: Text('The Weeknd',style: TextStyle(color: Colors.white),),
                  ),
                  ListTile(
                    onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => Spotify()));
                          },
                    leading: CircleAvatar(child: Image.asset('assets/images/taylor.jpg'),),
                    title: Text('Anti-Hero',style: TextStyle(color: Colors.white),),
                    subtitle: Text('Taylor Swift',style: TextStyle(color: Colors.white),),
                  ),
                  ListTile(
                    onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => Spotify()));
                          },
                    leading: CircleAvatar(child: Image.asset('assets/images/mtp.jpg'),),
                    title: Text('Making My Way',style: TextStyle(color: Colors.white),),
                    subtitle: Text('Son Tung MT-P',style: TextStyle(color: Colors.white),),
                  ),
                    ],
                  ),
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
}