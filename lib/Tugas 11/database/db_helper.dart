
import 'package:belajar_flutter/Tugas%2011/model/bus_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'jadwal.db'),
      onCreate: (db, version) async {
        return db.execute(
          'CREATE TABLE jadwal(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, email TEXT, kelas integer, rute TEXT, waktu TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertJadwal(JadwalBus jadwal) async {
    final db = await DBHelper.db();
    await db.insert(
      'jadwal',
      jadwal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<JadwalBus>> getAllJadwal() async {
    final db = await DBHelper.db();
    final List<Map<String, dynamic>> maps = await db.query('jadwal');
    return List.generate(maps.length, (i) => JadwalBus.fromMap(maps[i]));
  }
}
