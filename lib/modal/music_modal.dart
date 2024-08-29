class Song {
  final int id;
  final String title;
  final String artist;
  final String albumArt;
  final String url;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'albumArt': albumArt,
      'url': url,
    };
  }

  static Song fromMap(Map<String, dynamic> map) {
    return Song(
      id: map['id'],
      title: map['title'],
      artist: map['artist'],
      albumArt: map['albumArt'],
      url: map['url'],
    );
  }
}
