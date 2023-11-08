import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:drift/drift.dart';

part 'database.g.dart';

class TransactionItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get amount => integer()();

  TextColumn get item => text().nullable()();
}

@DriftDatabase(tables: [TransactionItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  // THIS IS USEFUL FOR MIGRATION. CURRENT DATABASE VERSION IS 1.
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
