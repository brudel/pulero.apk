import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
	static Database? _database;

	MyDatabase._internal();

	static Future<Database> get _getDatabase async {
		if (_database != null) {
			return _database!;
		}

		_database = await _initDatabase();

		return _database!;
	}

	static Future<Database> _initDatabase() async {
		WidgetsFlutterBinding.ensureInitialized();

		return openDatabase(
			join(await getDatabasesPath(), 'pulero.db'),
			version: 1,
			onCreate: _onCreate,
			onUpgrade: _reset,
			onDowngrade: _reset,
		);
	}

	static _reset(Database db, int oldVersion, int newVersion) async {
		await deleteDatabase(join(await getDatabasesPath(), 'scratch.db'));
		await _onCreate(db, newVersion);
	}

	static Future<void> _onCreate(Database db, _) async {
	}

	static Future close() async {
		final db = await _getDatabase;
		db.close();
	}

	static Future<int> insert(
		String table,
		Map<String,Object?> values, {
		String? nullColumnHack,
		ConflictAlgorithm? conflictAlgorithm,
		Transaction? txn,
	}) async {
		final DatabaseExecutor db = txn ?? await _getDatabase;
		return db.insert(
			table,
			values,
			nullColumnHack: nullColumnHack,
			conflictAlgorithm: conflictAlgorithm
		);
	}

	static Future<int> update(
		String table,
		Map<String,Object?> values, {
		String? where,
		List<Object?>? whereArgs,
		ConflictAlgorithm? conflictAlgorithm,
		Transaction? txn,
	}) async {
		final db = txn ?? await _getDatabase;
		return db.update(
			table,
			values,
			where: where,
			whereArgs: whereArgs,
			conflictAlgorithm: conflictAlgorithm,
		);
	}

	static Future<int> delete(
		String table, {
		String? where,
		List<Object?>? whereArgs,
		Transaction? txn,
	}) async {
		final db = txn ?? await _getDatabase;
		return db.delete(
			table,
			where: where,
			whereArgs: whereArgs,
		);
	}

	static Future<List<Map<String,Object?>>> rawQuery(
		String sql, [
		List<Object?>? arguments,
	]) async {
		final db = await _getDatabase;
		return db.rawQuery(
			sql,
			arguments,
		);
	}

	static Future<List<Map<String,Object?>>> query(
		String table, {
		bool? distinct,
		List<String>? columns,
		String? where,
		List<Object?>? whereArgs,
		String? groupBy,
		String? having,
		String? orderBy,
		int? limit,
		int? offset,
		Transaction? txn,
	}) async {
		final DatabaseExecutor db = txn ?? await _getDatabase;
		return db.query(
			table,
			distinct: distinct,
			columns: columns,
			where: where,
			whereArgs: whereArgs,
			groupBy: groupBy,
			having: having,
			orderBy: orderBy,
			limit: limit,
			offset: offset,
		);
	}
	
	static Future<void> transaction(
		Future<void> Function(Transaction) action, {
			bool? exclusive,
	}) async {
		final db = await _getDatabase;
		await db.transaction(
			action,
			exclusive: exclusive,
		);
	}

	static Future<void> execute(String sql, [List<Object?>? arguments]) async {
		final db = await _getDatabase;
		db.execute(sql, arguments);
	}
}