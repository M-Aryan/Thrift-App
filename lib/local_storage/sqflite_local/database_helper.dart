import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'sqflite_db_model.dart';

class TransactionDatabase {
  static final TransactionDatabase instance = TransactionDatabase._init();
  static Database? _database;

  TransactionDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('transactions.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE transactions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        header TEXT NOT NULL,
        type TEXT NOT NULL,
        amount REAL NOT NULL,
        dateReceived DATE NOT NULL
      )
    ''');
  }

  Future<SqfliteDbModel> create(SqfliteDbModel transaction) async {
    final db = await instance.database;
    final id = await db.insert('transactions', transaction.toMap());
    return transaction.copyWith(id: id);
  }

  Future<List<SqfliteDbModel>> readAllTransactions() async {
    final db = await instance.database;
    final result = await db.query('transactions');

    return result.map((json) => SqfliteDbModel.fromMap(json)).toList();
  }

  //---------- Get Total Debited Amount (Page: Debit Payments)------------//
  Future<double> getTotalDebitAmount() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['SUM(amount) AS totalDebit'],
      where: 'type = ?',
      whereArgs: ['debit'],
    );

    double totalDebitAmount = 0.0;

    if (result.isNotEmpty && result[0]['totalDebit'] != null) {
      totalDebitAmount = result[0]['totalDebit'] as double;
    } else {
      // ---
    }

    return totalDebitAmount;
  }

  //---------- Get Total Credit Amount (Page: Credit Payments)------------//
  Future<double> getTotalCreditAmount() async {
    final Database db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['SUM(amount) AS totalCredit'],
      where: 'type = ?',
      whereArgs: ['credit'],
    );

    double totalCreditAmount = 0.0;

    if (result.isNotEmpty && result[0]['totalCredit'] != null) {
      totalCreditAmount = result[0]['totalCredit'] as double;
    } else {
      // ---
    }

    return totalCreditAmount;
  }

  // ---------------- Get Total Debit Amount for Day (Page: Home Screen)-----------//
  Future<double> getTotalDebitAmountForToday() async {
    final Database db = await database;

    // Get the current date in the format yyyy-MM-dd
    String currentDate = DateTime.now().toString().substring(0, 10);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['SUM(amount) AS totalDebitToday'],
      where: 'type = ? AND dateReceived LIKE ?',
      whereArgs: ['debit', '$currentDate%'],
    );

    double totalDebitAmountToday = 0.0;

    if (result.isNotEmpty && result[0]['totalDebitToday'] != null) {
      totalDebitAmountToday = result[0]['totalDebitToday'] as double;
    } else {
      // ---
    }

    return totalDebitAmountToday;
  }

  // ---------------- Get Total Credit Amount for Day (Page: Home Screen)-----------//
  Future<double> getTotalCreditAmountForToday() async {
    final Database db = await database;

    // Get the current date in the format yyyy-MM-dd
    String currentDate = DateTime.now().toString().substring(0, 10);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['SUM(amount) AS totalCreditToday'],
      where: 'type = ? AND dateReceived LIKE ?',
      whereArgs: ['credit', '$currentDate%'],
    );

    double totalCreditAmountToday = 0.0;

    if (result.isNotEmpty && result[0]['totalCreditToday'] != null) {
      totalCreditAmountToday = result[0]['totalCreditToday'] as double;
    } else {
      // ---
    }

    return totalCreditAmountToday;
  }

  // ---------------- Get Total Debit Amount for Month (Page: Home Screen)-----------//
  Future<double> getTotalDebitAmountForMonth() async {
    final Database db = await database;

    // Get the current date in the format yyyy-MM-dd
    String currentDate = DateTime.now().toString().substring(0, 7);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['SUM(amount) AS totalDebitMonth'],
      where: 'type = ? AND dateReceived LIKE ?',
      whereArgs: ['debit', '$currentDate%'],
    );

    double totalDebitAmountMonth = 0.0;

    if (result.isNotEmpty && result[0]['totalDebitMonth'] != null) {
      totalDebitAmountMonth = result[0]['totalDebitMonth'] as double;
    } else {
      // ---
    }

    return totalDebitAmountMonth;
  }

  // ---------------- Get Total Credit Amount for Month (Page: Home Screen)-----------//
  Future<double> getTotalCreditAmountForMonth() async {
    final Database db = await database;

    // Get the current date in the format yyyy-MM-dd
    String currentDate = DateTime.now().toString().substring(0, 7);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['SUM(amount) AS totalCreditMonth'],
      where: 'type = ? AND dateReceived LIKE ?',
      whereArgs: ['credit', '$currentDate%'],
    );

    double totalCreditAmountMonth = 0.0;

    if (result.isNotEmpty && result[0]['totalCreditMonth'] != null) {
      totalCreditAmountMonth = result[0]['totalCreditMonth'] as double;
    } else {
      // ---
    }

    return totalCreditAmountMonth;
  }

  // ---------------- Get Average Tramsaction Amount for Month (Page: Home Screen)-----------//
  Future<double> getAverageForMonth() async {
    final Database db = await database;

    // Get the current date in the format yyyy-MM-dd
    String currentDate = DateTime.now().toString().substring(0, 7);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['AVG(amount) AS averageTAmountPerMonth'],
      where: 'dateReceived LIKE ?',
      whereArgs: ['$currentDate%'],
    );

    double averageAmountMonth = 0.0;

    if (result.isNotEmpty && result[0]['averageTAmountPerMonth'] != null) {
      averageAmountMonth = result[0]['averageTAmountPerMonth'] as double;
    } else {
      // ---
    }

    return averageAmountMonth;
  }

  // ---------------- Get Total Number of Debit Transactions in Month (Page: Home Screen)-----------//
  Future<int> getTotalNoOfDebitForMonth() async {
    final Database db = await database;

    // Get the current date in the format yyyy-MM-dd
    String currentDate = DateTime.now().toString().substring(0, 7);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['COUNT(*) AS totalNoOfDebitMonth'],
      where: 'type = ? AND dateReceived LIKE ?',
      whereArgs: ['debit', '$currentDate%'],
    );

    int totalNoOfDebitInMonth = 0;

    if (result.isNotEmpty && result[0]['totalNoOfDebitMonth'] != null) {
      totalNoOfDebitInMonth = result[0]['totalNoOfDebitMonth'] as int;
    } else {
      // ---
    }

    return totalNoOfDebitInMonth;
  }

  // ---------------- Get Total Number of Credit Transactions in Month (Page: Home Screen)-----------//
  Future<int> getTotalNoOfCreditForMonth() async {
    final Database db = await database;

    // Get the current date in the format yyyy-MM-dd
    String currentDate = DateTime.now().toString().substring(0, 7);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['COUNT(*) AS totalNoOfCreditMonth'],
      where: 'type = ? AND dateReceived LIKE ?',
      whereArgs: ['credit', '$currentDate%'],
    );

    int totalNoOfCreditInMonth = 0;

    if (result.isNotEmpty && result[0]['totalNoOfCreditMonth'] != null) {
      totalNoOfCreditInMonth = result[0]['totalNoOfCreditMonth'] as int;
    } else {
      // ---
    }

    return totalNoOfCreditInMonth;
  }

  // ---------------- Get Total Number of Debit Amount for 'Date' (Page: Home Screen -- LineChart)-----------//
  Future<double> getTotalDebitAmountForDate(DateTime date) async {
    final Database db = await database;

    // Get the date in the format yyyy-MM-dd
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    final List<Map<String, dynamic>> result = await db.query(
      'transactions',
      columns: ['SUM(amount) AS totalDebitDate'],
      where: 'type = ? AND dateReceived LIKE ?',
      whereArgs: ['debit', '$formattedDate%'],
    );

    // Extract and return the total debit amount
    if (result.isNotEmpty && result[0]['totalDebitDate'] != null) {
      return result[0]['totalDebitDate'] as double;
    } else {
      return 0.0; // Return 0 if no debit transactions found for the date
    }
  }


  // -------------------- Delete the table / transaction data (Page: Profile) --------------------- //
  Future<void> clearTransactionsTable() async {
    final Database db = await database;

    // Delete all rows from the transactions table
    await db.delete('transactions');
    return;
  }
}
