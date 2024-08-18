import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:logger/logger.dart';

part 'database.g.dart'; // 生成的代码会被放在这里

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text().withLength(min: 1, max: 50).nullable()();
  TextColumn get nickName => text().withLength(min: 1, max: 50).nullable()();
  TextColumn get email => text().withLength(min: 1, max: 100)();
  TextColumn get password => text().withLength(min: 8, max: 100)();
}

@DataClassName('Token')
class Tokens extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get name => text().withLength(min: 1, max: 50).nullable()();
  TextColumn get nickName => text().withLength(min: 1, max: 50).nullable()();
  TextColumn get email => text().withLength(min: 1, max: 100).nullable()();
  TextColumn get token => text().withLength(min: 8, max: 100)();
  DateTimeColumn get loginTime => dateTime()();
}

@DriftDatabase(tables: [Users, Tokens])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  // DAO 方法
  Future<List<User>> getAllUsers() => select(users).get();
  Future<int> insertUser(User user) => into(users).insert(user);
  Future<bool> updateUser(User user) => update(users).replace(user);
  Future<int> deleteUser(User user) => delete(users).delete(user);

  Future<List<Token>> getAllTokens() => select(tokens).get();
  Future<int> insertToken(Token token) => into(tokens).insert(token);
  Future<bool> updateToken(Token token) => update(tokens).replace(token);
  Future<int> deleteToken(Token token) => delete(tokens).delete(token);
}

final _logger = Logger();

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // 获取应用程序文档目录
    final dbFolder = await getApplicationDocumentsDirectory();

    // 创建数据库文件路径
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    // 返回 SqfliteQueryExecutor，并指定路径
    _logger.i("SQLite database save path: $file.path");
    return SqfliteQueryExecutor(
      path: file.path, // 传递路径
      logStatements: true, // 可选的日志记录，便于调试
    );
  });
}
