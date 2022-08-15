// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CredentialData extends DataClass implements Insertable<CredentialData> {
  final int id;
  final String name;
  final String username;
  late String password;
  CredentialData(
      {required this.id,
      required this.name,
      required this.username,
      required this.password});
  factory CredentialData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CredentialData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      username: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}username'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    return map;
  }

  CredentialCompanion toCompanion(bool nullToAbsent) {
    return CredentialCompanion(
      id: Value(id),
      name: Value(name),
      username: Value(username),
      password: Value(password),
    );
  }

  factory CredentialData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CredentialData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
    };
  }

  CredentialData copyWith(
          {int? id, String? name, String? username, String? password}) =>
      CredentialData(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('CredentialData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, username, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CredentialData &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.password == this.password);
}

class CredentialCompanion extends UpdateCompanion<CredentialData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> username;
  final Value<String> password;
  const CredentialCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
  });
  CredentialCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String username,
    required String password,
  })  : name = Value(name),
        username = Value(username),
        password = Value(password);
  static Insertable<CredentialData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? username,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
    });
  }

  CredentialCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? username,
      Value<String>? password}) {
    return CredentialCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CredentialCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $CredentialTable extends Credential
    with TableInfo<$CredentialTable, CredentialData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CredentialTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  @override
  late final GeneratedColumn<String?> username = GeneratedColumn<String?>(
      'username', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  @override
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, username, password];
  @override
  String get aliasedName => _alias ?? 'credential';
  @override
  String get actualTableName => 'credential';
  @override
  VerificationContext validateIntegrity(Insertable<CredentialData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CredentialData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CredentialData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CredentialTable createAlias(String alias) {
    return $CredentialTable(attachedDatabase, alias);
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CredentialTable credential = $CredentialTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [credential];
}
