import 'package:flutter/material.dart';
import 'package:spotify/screen/album.dart';
import 'package:spotify/screen/playlist_screen.dart';

import 'home_spotify.dart';
class PlayListLibraryScreen extends StatefulWidget {
  const PlayListLibraryScreen({super.key});

  @override
  State<PlayListLibraryScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
              //   width: 45,
              // ),
              const Text(
                'PlayList',
                style: TextStyle(color: Colors.white),
              ),
            ],
            ),
            backgroundColor: Colors.black,
      ),
      body: Scrollbar(
        thickness: 5  , radius: const Radius.circular(5),
        child: GridView.count(
          mainAxisSpacing: 10, crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            
            Container(
              child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
                child: Image.asset('assets/images/billie.jpg', scale: 2,),
                
              ),
            
            ),
             ClipRRect(
                child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
               child: Image.asset('assets/images/taylor.jpg', scale: 2,),
                
              ),
                
            ),
             Container(
                child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
               child: Image.asset('assets/images/ed.jpg', scale: 2,),
                
              ),
            ),
             Container(
                child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
               child: Image.asset('assets/images/theweeknd.jpg', scale: 2,),
                
              ),
            ),
            Container(
                child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
               child : Image.asset('assets/images/eminem.jpg', scale: 2,),
                
              ),
            ),
            Container(
                child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
               child: Image.asset('assets/images/mtp.jpg', scale: 2,),
                
              )
            ),
            Container(
               child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
               child: Image.asset('assets/images/nicki.jpg', scale: 2,),
              
                
              ) 
            ),
            Container(
                child: GestureDetector(
                onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (build) => PlayListScreen()));
                          },
               child: Image.asset('assets/images/theweeknd.jpg', scale: 2,),
                
              )
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