import 'package:flutter/material.dart';
import 'package:spotify/screen/login.dart';
import 'package:spotify/screen/playlistLibrary_screen.dart';
class Spotify extends StatefulWidget {
  const Spotify({super.key});

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.logout_outlined,
            color: Colors.white,
          ),
          onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
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
        alignment: Alignment.topLeft,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.1),
                  Colors.black.withOpacity(0),
                ]
              ),
            ),

          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
              // constraints: BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Recently Player",
                       style: TextStyle(color: Colors.white, fontSize: 30),
                       ),
                      
                      Row(
                        children: [
                          Icon(Icons.history, color: Colors.white,),
                          SizedBox(width: 20,),
                          Icon(Icons.settings ,color: Colors.white,),
                        ],
                      )
                    ],
                  ),
                  
                  ),
                
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(20),
                  child: Row(
                  children: [
                    AlbumCard(label: "Best Mode",
                              image: AssetImage('assets/images/taylor.jpg'),
                              onTap: (){
                                  Navigator.push(
                                    context, 
                                  MaterialPageRoute(
                                    builder: (context) => const PlayListLibraryScreen(),
                                  ),);
                              }
                              ),
                    SizedBox(width: 20,),
                    AlbumCard(label: "Best Mode", image: AssetImage('assets/images/ed.jpg'),
                    onTap: (){
                                  Navigator.push(
                                    context, 
                                  MaterialPageRoute(
                                    builder: (context) => const PlayListLibraryScreen(),
                                  ),);
                              }),
                    SizedBox(width: 20,),
                    AlbumCard(label: "Best Mode", image: AssetImage('assets/images/theweeknd.jpg'),
                    onTap: (){
                                  Navigator.push(
                                    context, 
                                  MaterialPageRoute(
                                    builder: (context) => const PlayListLibraryScreen(),
                                  ),);
                              }),
                    SizedBox(width: 20,),
                    AlbumCard(label: "Best Mode", image: AssetImage('assets/images/mtp.jpg'),
                    onTap: (){
                                  Navigator.push(
                                    context, 
                                  MaterialPageRoute(
                                    builder: (context) => const PlayListLibraryScreen(),
                                  ),);
                              }),
                    SizedBox(width: 20,),
                    AlbumCard(label: "Best Mode", image: AssetImage('assets/images/eminem.jpg'),
                    onTap: (){
                                  Navigator.push(
                                    context, 
                                  MaterialPageRoute(
                                    builder: (context) => const PlayListLibraryScreen(),
                                  ),);
                              }),
                    SizedBox(width: 20,),
                    AlbumCard(label: "Best Mode", image: AssetImage('assets/images/nicki.jpg'),
                    onTap: (){
                                  Navigator.push(
                                    context, 
                                  MaterialPageRoute(
                                    builder: (context) => const PlayListLibraryScreen(),
                                  ),);
                              }),
                    SizedBox(width: 20,),
                    AlbumCard(label: "Best Mode", image: AssetImage('assets/images/taylor.jpg'),
                    onTap: (){
                                  Navigator.push(
                                    context, 
                                  MaterialPageRoute(
                                    builder: (context) => const PlayListLibraryScreen(),
                                  ),);
                              }),
                    
                  ],
                )
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Good Evening",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RowAlbumCard(
                          label: "Taylor Swift",
                          image: AssetImage("assets/images/taylor.jpg"),
                          
                        ),
                        SizedBox(width: 16,),
                        RowAlbumCard(
                          label: "Nicki Minaj",
                          image: AssetImage("assets/images/nicki.jpg"),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RowAlbumCard(
                          label: "Son Tung MTP",
                          image: AssetImage("assets/images/mtp.jpg"),
                        ),
                        SizedBox(width: 16,),
                        RowAlbumCard(
                          label: "The Weeknd",
                          image: AssetImage("assets/images/theweeknd.jpg"),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RowAlbumCard(
                          label: "Ed Sheeran",
                          image: AssetImage("assets/images/ed.jpg"),
                        ),
                        SizedBox(width: 16,),
                        RowAlbumCard(
                          label: "Eminem",
                          image: AssetImage("assets/images/eminem.jpg"),
                        ),
                      ],
                    ),
                  ],
                ),
                 ),
                 Padding(
                  padding: EdgeInsets.all(16.0)),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    
                      child: Image.asset('assets/images/rasa2.jpg', fit: BoxFit.cover),
                    ),
                                  
              ]),
          
          ),

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

class RowAlbumCard extends StatelessWidget {
  final AssetImage image;
  final String label;
  const RowAlbumCard({
    super.key, required this.image, required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(4),
          
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(children: [
          Image(image:image, height: 48, width: 48, fit: BoxFit.cover,
          ),
          SizedBox(width: 8,),
          Text(label, style: TextStyle(color: Colors.white),)
        ],),
      ),
    );
  }
}

class AlbumCard extends StatelessWidget {
  final ImageProvider image;
  final String label;
  final void Function()? onTap;
  const AlbumCard({
    super.key, required this.image, required this.label, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: image, width: 120, height: 120,),
        SizedBox(height: 10,),
        Text(label, style: TextStyle(color: Colors.white),)
      ],
      ),
    );
  }
}