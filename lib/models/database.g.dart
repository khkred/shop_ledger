// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TransactionItemsTable extends TransactionItems
    with TableInfo<$TransactionItemsTable, TransactionItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _itemMeta = const VerificationMeta('item');
  @override
  late final GeneratedColumn<String> item = GeneratedColumn<String>(
      'item', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, amount, item];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_items';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item']!, _itemMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      item: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item']),
    );
  }

  @override
  $TransactionItemsTable createAlias(String alias) {
    return $TransactionItemsTable(attachedDatabase, alias);
  }
}

class TransactionItem extends DataClass implements Insertable<TransactionItem> {
  final int id;
  final int amount;
  final String? item;
  const TransactionItem({required this.id, required this.amount, this.item});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    if (!nullToAbsent || item != null) {
      map['item'] = Variable<String>(item);
    }
    return map;
  }

  TransactionItemsCompanion toCompanion(bool nullToAbsent) {
    return TransactionItemsCompanion(
      id: Value(id),
      amount: Value(amount),
      item: item == null && nullToAbsent ? const Value.absent() : Value(item),
    );
  }

  factory TransactionItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionItem(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      item: serializer.fromJson<String?>(json['item']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'item': serializer.toJson<String?>(item),
    };
  }

  TransactionItem copyWith(
          {int? id, int? amount, Value<String?> item = const Value.absent()}) =>
      TransactionItem(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        item: item.present ? item.value : this.item,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionItem(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, item);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionItem &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.item == this.item);
}

class TransactionItemsCompanion extends UpdateCompanion<TransactionItem> {
  final Value<int> id;
  final Value<int> amount;
  final Value<String?> item;
  const TransactionItemsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.item = const Value.absent(),
  });
  TransactionItemsCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    this.item = const Value.absent(),
  }) : amount = Value(amount);
  static Insertable<TransactionItem> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<String>? item,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (item != null) 'item': item,
    });
  }

  TransactionItemsCompanion copyWith(
      {Value<int>? id, Value<int>? amount, Value<String?>? item}) {
    return TransactionItemsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      item: item ?? this.item,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (item.present) {
      map['item'] = Variable<String>(item.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionItemsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('item: $item')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TransactionItemsTable transactionItems =
      $TransactionItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [transactionItems];
}
