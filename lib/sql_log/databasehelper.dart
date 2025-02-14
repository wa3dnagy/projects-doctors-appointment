import 'package:cs_project_2/model/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  
  final String databaseName = 'auth.db';

  
  String userTable = '''
    CREATE TABLE users(
      userId INTEGER PRIMARY KEY AUTOINCREMENT,
      firstName TEXT,
      lastName TEXT,
      email TEXT UNIQUE,
      password TEXT,
      phoneNumber TEXT
    );
  ''';

 
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, databaseName);
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(userTable);
    });
  }

  
  Future<bool> authenticate(Users usr) async {
    final db = await initDB();
    var res = await db.rawQuery(
        "SELECT * FROM users WHERE email = ? AND password = ?",
        [usr.email, usr.password]);
    return res.isNotEmpty;
  }

  
  Future<int> createUser(Users usr) async {
    final db = await initDB();
    return await db.insert("users", usr.toMap());
  }

  
  Future<Users?> getUser(String email) async {
    final db = await initDB();
    var res = await db.query("users", where: "email = ?", whereArgs: [email]);
    return res.isNotEmpty ? Users.fromMap(res.first) : null;
  }

  Future<Users?> getUserByEmail(String email) async {
  final Database db = await initDB();
  var res = await db.query(
    "users",
    where: "email = ?",
    whereArgs: [email],
  );
  return res.isNotEmpty ? Users.fromMap(res.first) : null;
}
}
