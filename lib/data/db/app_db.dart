import 'dart:io';
import 'package:credential_manager/data/entity/credential.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_db.g.dart';

LazyDatabase _open() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(
      path.join(folder.path, 'credential_manager.sqlite'),
    );
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Credential])
class AppDb extends _$AppDb {
  AppDb() : super(_open());

  @override
  int get schemaVersion => 1;

  Future<CredentialData> getCredential(int id) async {
    return await (select(credential)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
  }

  Future<int> insertCredential(CredentialCompanion entity) async {
    return await into(credential).insert(entity);
  }

  Future<bool> updateCredential(CredentialCompanion entity) async {
    return await update(credential).replace(entity);
  }

  Future<int> deleteCredential(int id) async {
    return await (delete(credential)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<CredentialData>> getCredentials() async {
    return await select(credential).get();
  }
}
