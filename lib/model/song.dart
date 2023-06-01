class Song {
  String id;
  String title;
  String album;
  String artist;
  String genre;
  String source;
  String image;
  int trackNumber;
  int totalTrackCount;
  int duration;
  String site;
  Song(
      {required this.id,
      required this.title,
      required this.album,
      required this.artist,
      required this.genre,
      required this.source,
      required this.image,
      required this.trackNumber,
      required this.totalTrackCount,
      required this.duration,
      this.site = ""});

  factory Song.fromJson(Map<String, dynamic> json) => Song(
      id: json["_id"],
      title: json["title"],
      album: json["album"],
      artist: json["artist"],
      genre: json["genre"],
      source: json["source"],
      image: json["image"],
      trackNumber: json["trackNumber"],
      totalTrackCount: json["totalTrackCount"],
      duration: json["duration"]);

  Map<String, dynamic> _toJson() => {
        "_id": id,
        "title": title,
        "album": album,
        "artist": artist,
        "genre": genre,
        "source": source,
        "image": image,
        "trackNumber": trackNumber,
        "totalTrackCount": totalTrackCount,
        "duration": duration,
        "site": site,
      };
}