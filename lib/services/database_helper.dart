import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../constants/db_constants.dart';
import '../model/transaction_model.dart';

class DataBaseHandler {
  static final DataBaseHandler instance = DataBaseHandler._init();

  DataBaseHandler._init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _openDB();
    return _database!;
  }

  Future<Database> _openDB()   async {
    String path = join(await getDatabasesPath(), 'noteDatabase.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
     CREATE TABLE $transactionsTable(
     $transactionID $idType,
     $transactionName $textType,
     $transactionType $textType,
     $transactionAmount $doubleType,
     $transactionDate $textType
     )
      ''');
  }

  ///CRUD
  //Create
  Future<void> addTransaction(TransactionModel transactionModel) async {
    final db = await instance.database;
    await db.insert(transactionsTable, transactionModel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


//ReadAll
  Future<List<TransactionModel>> getAllTransactions() async{
    final db=await instance.database;
    List<Map<String,dynamic>> maps = await db.query(transactionsTable);
    return maps.isNotEmpty ?
    maps.map((transaction) => TransactionModel.fromMap(transaction)).toList(): [];


  }
  Future<void> deleteTransaction(int id) async {
    final db = await instance.database;
    await db.delete(transactionsTable,
        where: '$transactionID= ?',
        whereArgs:[id]);
  }

}
