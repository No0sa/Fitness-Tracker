import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/activity.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'fitness_tracker.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE activities(
        id TEXT PRIMARY KEY,
        type TEXT,
        duration INTEGER,
        calories INTEGER,
        distance REAL,
        steps INTEGER,
        notes TEXT,
        timestamp TEXT
      )
    ''');
    
    // Insert initial data
    List<Activity> initialActivities = [
      Activity(
        id: '1',
        type: 'Running',
        duration: 30,
        calories: 250,
        distance: 5.2,
        steps: 6500,
        notes: 'Morning run in the park',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Activity(
        id: '2',
        type: 'Yoga',
        duration: 45,
        calories: 150,
        distance: 0,
        steps: 0,
        notes: 'Evening yoga session',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      Activity(
        id: '3',
        type: 'Cycling',
        duration: 60,
        calories: 400,
        distance: 15.5,
        steps: 0,
        notes: 'Bike ride along the coast',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];

    for (var activity in initialActivities) {
      await db.insert('activities', activity.toMap());
    }
  }

  Future<int> insertActivity(Activity activity) async {
    Database db = await database;
    return await db.insert('activities', activity.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Activity>> getActivities() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('activities', orderBy: 'timestamp DESC');
    return List.generate(maps.length, (i) {
      return Activity.fromMap(maps[i]);
    });
  }

  Future<int> deleteActivity(String id) async {
    Database db = await database;
    return await db.delete('activities', where: 'id = ?', whereArgs: [id]);
  }
}
