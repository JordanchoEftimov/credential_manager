import 'package:drift/drift.dart';

class Credential extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  TextColumn get username => text().named('username')();
  TextColumn get password => text().named('password')();
}