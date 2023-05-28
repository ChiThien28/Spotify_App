import 'package:flutter/material.dart';
import 'package:spotify/screen/playlist_screen.dart';

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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   width: 45,
            // ),
            Text(
              'PlayList',
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
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (build) => const PlayListScreen()));
                },
                child: Image.asset(
                  'assets/images/billie.jpg',
                  scale: 2,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/taylor.jpg',
                scale: 2,
              ),
            ),
            Container(
              child: Image.asset(
                'assets/images/ed.jpg',
                scale: 2,
              ),
            ),
            Container(
              child: Image.asset(
                'assets/images/theweeknd.jpg',
                scale: 2,
              ),
            ),
            Container(
              child: Image.asset(
                'assets/images/eminem.jpg',
                scale: 2,
              ),
            ),
            Container(
              child: Image.asset(
                'assets/images/mtp.jpg',
                scale: 2,
              ),
            ),
            Container(
              child: Image.asset(
                'assets/images/nicki.jpg',
                scale: 2,
              ),
            ),
            Container(
              child: Image.asset(
                'assets/images/theweeknd.jpg',
                scale: 2,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 58, 57, 57)),
            child: const Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 10, 127, 14),
              size: 40,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 58, 57, 57)),
            child: const Icon(
              Icons.library_music_outlined,
              color: Color.fromARGB(255, 10, 127, 14),
              size: 40,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 58, 57, 57)),
            child: const Icon(
              Icons.access_time,
              color: Color.fromARGB(255, 10, 127, 14),
              size: 40,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 80,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 58, 57, 57)),
            child: const Icon(
              Icons.person_2_outlined,
              color: Color.fromARGB(255, 10, 127, 14),
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
