import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'booking.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE bookings (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            firstName TEXT,
            gender TEXT,
            age TEXT,
            phoneNumber TEXT,
            doctorName TEXT,
            specialty TEXT,
            chronicDiseases TEXT,
            selectedDate TEXT,
            selectedTime TEXT
          )
        ''');
      },
    );
  }

  Future<int> insertBooking(Map<String, dynamic> booking) async {
    final db = await database;
    return await db.insert('bookings', booking);
  }

  Future<List<Map<String, dynamic>>> getBookings() async {
    final db = await database;
    return await db.query('bookings');
  }

    Future<void> deleteBooking(int id) async {
    final db = await database;
    await db.delete(
      'bookings',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
