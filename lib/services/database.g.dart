// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _nickNameMeta =
      const VerificationMeta('nickName');
  @override
  late final GeneratedColumn<String> nickName = GeneratedColumn<String>(
      'nick_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 8, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, nickName, email, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('nick_name')) {
      context.handle(_nickNameMeta,
          nickName.isAcceptableOrUnknown(data['nick_name']!, _nickNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
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
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      nickName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nick_name']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int? id;
  final String? name;
  final String? nickName;
  final String email;
  final String password;
  const User(
      {this.id,
      this.name,
      this.nickName,
      required this.email,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || nickName != null) {
      map['nick_name'] = Variable<String>(nickName);
    }
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      nickName: nickName == null && nullToAbsent
          ? const Value.absent()
          : Value(nickName),
      email: Value(email),
      password: Value(password),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      nickName: serializer.fromJson<String?>(json['nickName']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'nickName': serializer.toJson<String?>(nickName),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
    };
  }

  User copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> nickName = const Value.absent(),
          String? email,
          String? password}) =>
      User(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        nickName: nickName.present ? nickName.value : this.nickName,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nickName: data.nickName.present ? data.nickName.value : this.nickName,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickName: $nickName, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nickName, email, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.nickName == this.nickName &&
          other.email == this.email &&
          other.password == this.password);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> nickName;
  final Value<String> email;
  final Value<String> password;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickName = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickName = const Value.absent(),
    required String email,
    required String password,
  })  : email = Value(email),
        password = Value(password);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nickName,
    Expression<String>? email,
    Expression<String>? password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nickName != null) 'nick_name': nickName,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
    });
  }

  UsersCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<String?>? nickName,
      Value<String>? email,
      Value<String>? password}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
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
    if (nickName.present) {
      map['nick_name'] = Variable<String>(nickName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickName: $nickName, ')
          ..write('email: $email, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $TokensTable extends Tokens with TableInfo<$TokensTable, Token> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TokensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _nickNameMeta =
      const VerificationMeta('nickName');
  @override
  late final GeneratedColumn<String> nickName = GeneratedColumn<String>(
      'nick_name', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _tokenMeta = const VerificationMeta('token');
  @override
  late final GeneratedColumn<String> token = GeneratedColumn<String>(
      'token', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 8, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _loginTimeMeta =
      const VerificationMeta('loginTime');
  @override
  late final GeneratedColumn<DateTime> loginTime = GeneratedColumn<DateTime>(
      'login_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, nickName, email, token, loginTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tokens';
  @override
  VerificationContext validateIntegrity(Insertable<Token> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('nick_name')) {
      context.handle(_nickNameMeta,
          nickName.isAcceptableOrUnknown(data['nick_name']!, _nickNameMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token']!, _tokenMeta));
    } else if (isInserting) {
      context.missing(_tokenMeta);
    }
    if (data.containsKey('login_time')) {
      context.handle(_loginTimeMeta,
          loginTime.isAcceptableOrUnknown(data['login_time']!, _loginTimeMeta));
    } else if (isInserting) {
      context.missing(_loginTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Token map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Token(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      nickName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nick_name']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}token'])!,
      loginTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}login_time'])!,
    );
  }

  @override
  $TokensTable createAlias(String alias) {
    return $TokensTable(attachedDatabase, alias);
  }
}

class Token extends DataClass implements Insertable<Token> {
  final int? id;
  final String? name;
  final String? nickName;
  final String? email;
  final String token;
  final DateTime loginTime;
  const Token(
      {this.id,
      this.name,
      this.nickName,
      this.email,
      required this.token,
      required this.loginTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || nickName != null) {
      map['nick_name'] = Variable<String>(nickName);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['token'] = Variable<String>(token);
    map['login_time'] = Variable<DateTime>(loginTime);
    return map;
  }

  TokensCompanion toCompanion(bool nullToAbsent) {
    return TokensCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      nickName: nickName == null && nullToAbsent
          ? const Value.absent()
          : Value(nickName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      token: Value(token),
      loginTime: Value(loginTime),
    );
  }

  factory Token.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Token(
      id: serializer.fromJson<int?>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      nickName: serializer.fromJson<String?>(json['nickName']),
      email: serializer.fromJson<String?>(json['email']),
      token: serializer.fromJson<String>(json['token']),
      loginTime: serializer.fromJson<DateTime>(json['loginTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'name': serializer.toJson<String?>(name),
      'nickName': serializer.toJson<String?>(nickName),
      'email': serializer.toJson<String?>(email),
      'token': serializer.toJson<String>(token),
      'loginTime': serializer.toJson<DateTime>(loginTime),
    };
  }

  Token copyWith(
          {Value<int?> id = const Value.absent(),
          Value<String?> name = const Value.absent(),
          Value<String?> nickName = const Value.absent(),
          Value<String?> email = const Value.absent(),
          String? token,
          DateTime? loginTime}) =>
      Token(
        id: id.present ? id.value : this.id,
        name: name.present ? name.value : this.name,
        nickName: nickName.present ? nickName.value : this.nickName,
        email: email.present ? email.value : this.email,
        token: token ?? this.token,
        loginTime: loginTime ?? this.loginTime,
      );
  Token copyWithCompanion(TokensCompanion data) {
    return Token(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      nickName: data.nickName.present ? data.nickName.value : this.nickName,
      email: data.email.present ? data.email.value : this.email,
      token: data.token.present ? data.token.value : this.token,
      loginTime: data.loginTime.present ? data.loginTime.value : this.loginTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Token(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickName: $nickName, ')
          ..write('email: $email, ')
          ..write('token: $token, ')
          ..write('loginTime: $loginTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, nickName, email, token, loginTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Token &&
          other.id == this.id &&
          other.name == this.name &&
          other.nickName == this.nickName &&
          other.email == this.email &&
          other.token == this.token &&
          other.loginTime == this.loginTime);
}

class TokensCompanion extends UpdateCompanion<Token> {
  final Value<int?> id;
  final Value<String?> name;
  final Value<String?> nickName;
  final Value<String?> email;
  final Value<String> token;
  final Value<DateTime> loginTime;
  const TokensCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickName = const Value.absent(),
    this.email = const Value.absent(),
    this.token = const Value.absent(),
    this.loginTime = const Value.absent(),
  });
  TokensCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.nickName = const Value.absent(),
    this.email = const Value.absent(),
    required String token,
    required DateTime loginTime,
  })  : token = Value(token),
        loginTime = Value(loginTime);
  static Insertable<Token> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? nickName,
    Expression<String>? email,
    Expression<String>? token,
    Expression<DateTime>? loginTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (nickName != null) 'nick_name': nickName,
      if (email != null) 'email': email,
      if (token != null) 'token': token,
      if (loginTime != null) 'login_time': loginTime,
    });
  }

  TokensCompanion copyWith(
      {Value<int?>? id,
      Value<String?>? name,
      Value<String?>? nickName,
      Value<String?>? email,
      Value<String>? token,
      Value<DateTime>? loginTime}) {
    return TokensCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      nickName: nickName ?? this.nickName,
      email: email ?? this.email,
      token: token ?? this.token,
      loginTime: loginTime ?? this.loginTime,
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
    if (nickName.present) {
      map['nick_name'] = Variable<String>(nickName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    if (loginTime.present) {
      map['login_time'] = Variable<DateTime>(loginTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokensCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('nickName: $nickName, ')
          ..write('email: $email, ')
          ..write('token: $token, ')
          ..write('loginTime: $loginTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $TokensTable tokens = $TokensTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, tokens];
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int?> id,
  Value<String?> name,
  Value<String?> nickName,
  required String email,
  required String password,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int?> id,
  Value<String?> name,
  Value<String?> nickName,
  Value<String> email,
  Value<String> password,
});

class $$UsersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nickName => $state.composableBuilder(
      column: $state.table.nickName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UsersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nickName => $state.composableBuilder(
      column: $state.table.nickName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get password => $state.composableBuilder(
      column: $state.table.password,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UsersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UsersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> nickName = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> password = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            nickName: nickName,
            email: email,
            password: password,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> nickName = const Value.absent(),
            required String email,
            required String password,
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            nickName: nickName,
            email: email,
            password: password,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$TokensTableCreateCompanionBuilder = TokensCompanion Function({
  Value<int?> id,
  Value<String?> name,
  Value<String?> nickName,
  Value<String?> email,
  required String token,
  required DateTime loginTime,
});
typedef $$TokensTableUpdateCompanionBuilder = TokensCompanion Function({
  Value<int?> id,
  Value<String?> name,
  Value<String?> nickName,
  Value<String?> email,
  Value<String> token,
  Value<DateTime> loginTime,
});

class $$TokensTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TokensTable> {
  $$TokensTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nickName => $state.composableBuilder(
      column: $state.table.nickName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get loginTime => $state.composableBuilder(
      column: $state.table.loginTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TokensTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TokensTable> {
  $$TokensTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nickName => $state.composableBuilder(
      column: $state.table.nickName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get email => $state.composableBuilder(
      column: $state.table.email,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get token => $state.composableBuilder(
      column: $state.table.token,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get loginTime => $state.composableBuilder(
      column: $state.table.loginTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TokensTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TokensTable,
    Token,
    $$TokensTableFilterComposer,
    $$TokensTableOrderingComposer,
    $$TokensTableCreateCompanionBuilder,
    $$TokensTableUpdateCompanionBuilder,
    (Token, BaseReferences<_$AppDatabase, $TokensTable, Token>),
    Token,
    PrefetchHooks Function()> {
  $$TokensTableTableManager(_$AppDatabase db, $TokensTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TokensTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TokensTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> nickName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String> token = const Value.absent(),
            Value<DateTime> loginTime = const Value.absent(),
          }) =>
              TokensCompanion(
            id: id,
            name: name,
            nickName: nickName,
            email: email,
            token: token,
            loginTime: loginTime,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> nickName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            required String token,
            required DateTime loginTime,
          }) =>
              TokensCompanion.insert(
            id: id,
            name: name,
            nickName: nickName,
            email: email,
            token: token,
            loginTime: loginTime,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TokensTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TokensTable,
    Token,
    $$TokensTableFilterComposer,
    $$TokensTableOrderingComposer,
    $$TokensTableCreateCompanionBuilder,
    $$TokensTableUpdateCompanionBuilder,
    (Token, BaseReferences<_$AppDatabase, $TokensTable, Token>),
    Token,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$TokensTableTableManager get tokens =>
      $$TokensTableTableManager(_db, _db.tokens);
}
