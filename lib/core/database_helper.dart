import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../domain/models/expense.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  bool isTestMode = false;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB({bool testMode = false}) async {
    isTestMode = testMode;

    if (testMode) {
      /// Initialize database for tests (in-memory)
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      return await databaseFactory.openDatabase(inMemoryDatabasePath, options: OpenDatabaseOptions(
        version: 1,
        onCreate: createDB,
      ));
    } else {
      /// Normal database initialization
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'expenses.db');

      return await openDatabase(
        path,
        version: 1,
        onCreate: createDB,
      );
    }
  }

  Future<void> createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE expenses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        amount REAL,
        date TEXT,
        description TEXT,
        category TEXT
      )
    ''');
  }

  /// Insert an expense into the database
  Future<int> insertExpense(Expense expense) async {
    final db = await database;
    return await db.insert('expenses', expense.toMap());
  }

/// Retrieve all expenses from the database
  Future<List<Expense>> getExpenses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('expenses');

    return List.generate(maps.length, (i) {
      return Expense.fromMap(maps[i]);
    });
  }
}
