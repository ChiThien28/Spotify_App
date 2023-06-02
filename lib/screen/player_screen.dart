import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify/model/song.dart';
import 'package:spotify/screen/playlist_screen.dart';

class PlayerScreen extends StatefulWidget {
  int index;
  List<Map<String, Object?>> song;
  PlayerScreen({super.key, required this.index, required this.song});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late Song songItem;
  int index = 0;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration posiotion = Duration.zero;
  bool _isPlaying = false;
  bool _isAutoChangeSong = false;
  var iconAction = const Icon(
    Icons.play_arrow,
    size: 40.0,
  );

  void _updatePlayerScreen() {
    setState(() {
      // Cập nhật các biến trạng thái liên quan đến giao diện người dùng
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index;
    songItem = Song.fromJson(widget.song[index]);

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
        if (state == PlayerState.completed) {
          iconAction = const Icon(
            Icons.play_arrow,
            size: 40.0,
          );
          _updatePlayerScreen();
          if (_isAutoChangeSong && index < widget.song.length) {
            setState(() {
              index++;
              songItem = Song.fromJson(widget.song[index]);
              iconAction = const Icon(
                Icons.pause,
                size: 40.0,
              );
              if (!_isPlaying) {
                late Source audioUrl;
                audioUrl = UrlSource(songItem.source);
                audioPlayer.play(audioUrl);
              }
            });
            _updatePlayerScreen();
          }
        }
      });
    });

    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     _isPlaying = state == PlayerState.playing;
    //     if (state == PlayerState.completed) {
    //       print("Music has completed!");
    //       iconAction = const Icon(
    //         Icons.play_arrow,
    //         size: 40.0,
    //       );
    //       _updatePlayerScreen();
    //       if (_isAutoChangeSong) {
    //         if (index < widget.song.length) {
    //           index++;
    //           songItem = Song.fromJson(widget.song[index]);
    //           _updatePlayerScreen();
    //         }
    //       }
    //     }
    //   });
    // });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        posiotion = newPosition;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: _displayPlayer()));
  }

  Widget _displayPlayer() {
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.7),
        ),
        Positioned(
          left: 20.0,
          top: 40.0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PlayListScreen()),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Now Playing",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
                child: Align(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(31.0),
                    child: Image.network(songItem.image,
                        width: 310.0, height: 300.0, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 310.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              songItem.title,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              songItem.artist,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 340.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Slider(
                          min: 0,
                          max: duration.inSeconds.toDouble(),
                          value: posiotion.inSeconds.toDouble(),
                          onChanged: (value) async {
                            final posiotion = Duration(seconds: value.toInt());
                            await audioPlayer.seek(posiotion);
                            await audioPlayer.resume();
                          },
                          activeColor: const Color(0xFFA9A9A9),
                          inactiveColor: const Color(0xFF474747),
                        ))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 310.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          formatTime(posiotion),
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          formatTime(duration - posiotion),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: 310.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            setState(() {
                              _isAutoChangeSong = !_isAutoChangeSong;
                            });
                            print(_isAutoChangeSong);
                          },
                          icon: const Icon(
                              IconData(0xe0c1, fontFamily: 'MaterialIcons'),
                              size: 32,
                              color: Color(0xFFFFFFFF)),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (index > 0) {
                              setState(() {
                                index--;
                                songItem = Song.fromJson(widget.song[index]);
                                iconAction = const Icon(
                                  Icons.pause,
                                  size: 40.0,
                                );
                              });
                            }

                            if (_isPlaying) {
                              await audioPlayer.pause();
                              late Source audioUrl;
                              audioUrl = UrlSource(songItem.source);
                              await audioPlayer.play(audioUrl);
                            } else {
                              late Source audioUrl;
                              audioUrl = UrlSource(songItem.source);
                              await audioPlayer.play(audioUrl);
                            }

                            _updatePlayerScreen();
                          },
                          icon: const Icon(Icons.skip_previous_sharp,
                              size: 32, color: Color(0xFFFFFFFF)),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                iconAction = _isPlaying
                                    ? const Icon(
                                        Icons.play_arrow,
                                        size: 40.0,
                                      )
                                    : const Icon(
                                        Icons.pause,
                                        size: 40.0,
                                      );
                              });
                              if (_isPlaying) {
                                await audioPlayer.pause();
                              } else {
                                late Source audioUrl;
                                audioUrl = UrlSource(songItem.source);
                                await audioPlayer.play(audioUrl);
                              }
                              _updatePlayerScreen();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                primary: const Color(0xFF1ED760),
                                padding: const EdgeInsets.all(23.0)),
                            child: iconAction),
                        IconButton(
                          onPressed: () async {
                            if (index < widget.song.length) {
                              setState(() {
                                index++;
                                songItem = Song.fromJson(widget.song[index]);
                                iconAction = const Icon(
                                  Icons.pause,
                                  size: 40.0,
                                );
                              });
                              if (_isPlaying) {
                                await audioPlayer.pause();
                                late Source audioUrl;
                                audioUrl = UrlSource(songItem.source);
                                await audioPlayer.play(audioUrl);
                              } else {
                                late Source audioUrl;
                                audioUrl = UrlSource(songItem.source);
                                await audioPlayer.play(audioUrl);
                              }
                            }

                            _updatePlayerScreen();
                          },
                          icon: const Icon(Icons.skip_next_sharp,
                              size: 32, color: Color(0xFFFFFFFF)),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.skip_next_sharp,
                              size: 32, color: Color(0xFFFFFFFF)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ],
        )
      ],
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(":");
  }
}
