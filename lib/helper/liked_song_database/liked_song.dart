import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../modal/music_modal.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('music.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE likedSongs (
      id INTEGER PRIMARY KEY,
      title TEXT,
      artist TEXT,
      albumArt TEXT,
      url TEXT
    )
    ''');
  }

  Future<void> insertLikedSong(Song song) async {
    final db = await instance.database;
    await db.insert('likedSongs', song.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteLikedSong(int id) async {
    final db = await instance.database;
    await db.delete('likedSongs', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Song>> getLikedSongs() async {
    final db = await instance.database;
    final result = await db.query('likedSongs');
    return result.map((json) => Song.fromMap(json)).toList();
  }
}
