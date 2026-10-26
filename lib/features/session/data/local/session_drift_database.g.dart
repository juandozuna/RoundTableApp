// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_drift_database.dart';

// ignore_for_file: type=lint
class $CurriculumValuesTable extends CurriculumValues
    with TableInfo<$CurriculumValuesTable, ValueRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurriculumValuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moduleIdMeta = const VerificationMeta(
    'moduleId',
  );
  @override
  late final GeneratedColumn<String> moduleId = GeneratedColumn<String>(
    'module_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberInModuleMeta = const VerificationMeta(
    'numberInModule',
  );
  @override
  late final GeneratedColumn<int> numberInModule = GeneratedColumn<int>(
    'number_in_module',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sequenceMeta = const VerificationMeta(
    'sequence',
  );
  @override
  late final GeneratedColumn<int> sequence = GeneratedColumn<int>(
    'sequence',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bookletReferenceMeta = const VerificationMeta(
    'bookletReference',
  );
  @override
  late final GeneratedColumn<String> bookletReference = GeneratedColumn<String>(
    'booklet_reference',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    moduleId,
    numberInModule,
    sequence,
    name,
    description,
    bookletReference,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'curriculum_values';
  @override
  VerificationContext validateIntegrity(
    Insertable<ValueRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('module_id')) {
      context.handle(
        _moduleIdMeta,
        moduleId.isAcceptableOrUnknown(data['module_id']!, _moduleIdMeta),
      );
    }
    if (data.containsKey('number_in_module')) {
      context.handle(
        _numberInModuleMeta,
        numberInModule.isAcceptableOrUnknown(
          data['number_in_module']!,
          _numberInModuleMeta,
        ),
      );
    }
    if (data.containsKey('sequence')) {
      context.handle(
        _sequenceMeta,
        sequence.isAcceptableOrUnknown(data['sequence']!, _sequenceMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('booklet_reference')) {
      context.handle(
        _bookletReferenceMeta,
        bookletReference.isAcceptableOrUnknown(
          data['booklet_reference']!,
          _bookletReferenceMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ValueRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ValueRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      moduleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}module_id'],
      ),
      numberInModule: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_in_module'],
      ),
      sequence: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sequence'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      bookletReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}booklet_reference'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
    );
  }

  @override
  $CurriculumValuesTable createAlias(String alias) {
    return $CurriculumValuesTable(attachedDatabase, alias);
  }
}

class ValueRow extends DataClass implements Insertable<ValueRow> {
  final String id;
  final String? moduleId;
  final int? numberInModule;
  final int? sequence;
  final String? name;
  final String? description;
  final String? bookletReference;
  final String? status;
  const ValueRow({
    required this.id,
    this.moduleId,
    this.numberInModule,
    this.sequence,
    this.name,
    this.description,
    this.bookletReference,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || moduleId != null) {
      map['module_id'] = Variable<String>(moduleId);
    }
    if (!nullToAbsent || numberInModule != null) {
      map['number_in_module'] = Variable<int>(numberInModule);
    }
    if (!nullToAbsent || sequence != null) {
      map['sequence'] = Variable<int>(sequence);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || bookletReference != null) {
      map['booklet_reference'] = Variable<String>(bookletReference);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  CurriculumValuesCompanion toCompanion(bool nullToAbsent) {
    return CurriculumValuesCompanion(
      id: Value(id),
      moduleId: moduleId == null && nullToAbsent
          ? const Value.absent()
          : Value(moduleId),
      numberInModule: numberInModule == null && nullToAbsent
          ? const Value.absent()
          : Value(numberInModule),
      sequence: sequence == null && nullToAbsent
          ? const Value.absent()
          : Value(sequence),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      bookletReference: bookletReference == null && nullToAbsent
          ? const Value.absent()
          : Value(bookletReference),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory ValueRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ValueRow(
      id: serializer.fromJson<String>(json['id']),
      moduleId: serializer.fromJson<String?>(json['moduleId']),
      numberInModule: serializer.fromJson<int?>(json['numberInModule']),
      sequence: serializer.fromJson<int?>(json['sequence']),
      name: serializer.fromJson<String?>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      bookletReference: serializer.fromJson<String?>(json['bookletReference']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'moduleId': serializer.toJson<String?>(moduleId),
      'numberInModule': serializer.toJson<int?>(numberInModule),
      'sequence': serializer.toJson<int?>(sequence),
      'name': serializer.toJson<String?>(name),
      'description': serializer.toJson<String?>(description),
      'bookletReference': serializer.toJson<String?>(bookletReference),
      'status': serializer.toJson<String?>(status),
    };
  }

  ValueRow copyWith({
    String? id,
    Value<String?> moduleId = const Value.absent(),
    Value<int?> numberInModule = const Value.absent(),
    Value<int?> sequence = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> description = const Value.absent(),
    Value<String?> bookletReference = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => ValueRow(
    id: id ?? this.id,
    moduleId: moduleId.present ? moduleId.value : this.moduleId,
    numberInModule: numberInModule.present
        ? numberInModule.value
        : this.numberInModule,
    sequence: sequence.present ? sequence.value : this.sequence,
    name: name.present ? name.value : this.name,
    description: description.present ? description.value : this.description,
    bookletReference: bookletReference.present
        ? bookletReference.value
        : this.bookletReference,
    status: status.present ? status.value : this.status,
  );
  ValueRow copyWithCompanion(CurriculumValuesCompanion data) {
    return ValueRow(
      id: data.id.present ? data.id.value : this.id,
      moduleId: data.moduleId.present ? data.moduleId.value : this.moduleId,
      numberInModule: data.numberInModule.present
          ? data.numberInModule.value
          : this.numberInModule,
      sequence: data.sequence.present ? data.sequence.value : this.sequence,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      bookletReference: data.bookletReference.present
          ? data.bookletReference.value
          : this.bookletReference,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ValueRow(')
          ..write('id: $id, ')
          ..write('moduleId: $moduleId, ')
          ..write('numberInModule: $numberInModule, ')
          ..write('sequence: $sequence, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('bookletReference: $bookletReference, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    moduleId,
    numberInModule,
    sequence,
    name,
    description,
    bookletReference,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueRow &&
          other.id == this.id &&
          other.moduleId == this.moduleId &&
          other.numberInModule == this.numberInModule &&
          other.sequence == this.sequence &&
          other.name == this.name &&
          other.description == this.description &&
          other.bookletReference == this.bookletReference &&
          other.status == this.status);
}

class CurriculumValuesCompanion extends UpdateCompanion<ValueRow> {
  final Value<String> id;
  final Value<String?> moduleId;
  final Value<int?> numberInModule;
  final Value<int?> sequence;
  final Value<String?> name;
  final Value<String?> description;
  final Value<String?> bookletReference;
  final Value<String?> status;
  final Value<int> rowid;
  const CurriculumValuesCompanion({
    this.id = const Value.absent(),
    this.moduleId = const Value.absent(),
    this.numberInModule = const Value.absent(),
    this.sequence = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.bookletReference = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CurriculumValuesCompanion.insert({
    required String id,
    this.moduleId = const Value.absent(),
    this.numberInModule = const Value.absent(),
    this.sequence = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.bookletReference = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<ValueRow> custom({
    Expression<String>? id,
    Expression<String>? moduleId,
    Expression<int>? numberInModule,
    Expression<int>? sequence,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? bookletReference,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (moduleId != null) 'module_id': moduleId,
      if (numberInModule != null) 'number_in_module': numberInModule,
      if (sequence != null) 'sequence': sequence,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (bookletReference != null) 'booklet_reference': bookletReference,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CurriculumValuesCompanion copyWith({
    Value<String>? id,
    Value<String?>? moduleId,
    Value<int?>? numberInModule,
    Value<int?>? sequence,
    Value<String?>? name,
    Value<String?>? description,
    Value<String?>? bookletReference,
    Value<String?>? status,
    Value<int>? rowid,
  }) {
    return CurriculumValuesCompanion(
      id: id ?? this.id,
      moduleId: moduleId ?? this.moduleId,
      numberInModule: numberInModule ?? this.numberInModule,
      sequence: sequence ?? this.sequence,
      name: name ?? this.name,
      description: description ?? this.description,
      bookletReference: bookletReference ?? this.bookletReference,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (moduleId.present) {
      map['module_id'] = Variable<String>(moduleId.value);
    }
    if (numberInModule.present) {
      map['number_in_module'] = Variable<int>(numberInModule.value);
    }
    if (sequence.present) {
      map['sequence'] = Variable<int>(sequence.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (bookletReference.present) {
      map['booklet_reference'] = Variable<String>(bookletReference.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurriculumValuesCompanion(')
          ..write('id: $id, ')
          ..write('moduleId: $moduleId, ')
          ..write('numberInModule: $numberInModule, ')
          ..write('sequence: $sequence, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('bookletReference: $bookletReference, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ValueQuestionsTable extends ValueQuestions
    with TableInfo<$ValueQuestionsTable, QuestionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ValueQuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueIdMeta = const VerificationMeta(
    'valueId',
  );
  @override
  late final GeneratedColumn<String> valueId = GeneratedColumn<String>(
    'value_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questionCodeMeta = const VerificationMeta(
    'questionCode',
  );
  @override
  late final GeneratedColumn<String> questionCode = GeneratedColumn<String>(
    'question_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questionTextMeta = const VerificationMeta(
    'questionText',
  );
  @override
  late final GeneratedColumn<String> questionText = GeneratedColumn<String>(
    'question_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _responseTypeMeta = const VerificationMeta(
    'responseType',
  );
  @override
  late final GeneratedColumn<String> responseType = GeneratedColumn<String>(
    'response_type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    valueId,
    questionCode,
    questionText,
    sortOrder,
    responseType,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'value_questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<QuestionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('value_id')) {
      context.handle(
        _valueIdMeta,
        valueId.isAcceptableOrUnknown(data['value_id']!, _valueIdMeta),
      );
    }
    if (data.containsKey('question_code')) {
      context.handle(
        _questionCodeMeta,
        questionCode.isAcceptableOrUnknown(
          data['question_code']!,
          _questionCodeMeta,
        ),
      );
    }
    if (data.containsKey('question_text')) {
      context.handle(
        _questionTextMeta,
        questionText.isAcceptableOrUnknown(
          data['question_text']!,
          _questionTextMeta,
        ),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('response_type')) {
      context.handle(
        _responseTypeMeta,
        responseType.isAcceptableOrUnknown(
          data['response_type']!,
          _responseTypeMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  QuestionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return QuestionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      valueId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_id'],
      ),
      questionCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_code'],
      ),
      questionText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_text'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      ),
      responseType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}response_type'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
    );
  }

  @override
  $ValueQuestionsTable createAlias(String alias) {
    return $ValueQuestionsTable(attachedDatabase, alias);
  }
}

class QuestionRow extends DataClass implements Insertable<QuestionRow> {
  final String id;
  final String? valueId;
  final String? questionCode;
  final String? questionText;
  final int? sortOrder;
  final String? responseType;
  final String? status;
  const QuestionRow({
    required this.id,
    this.valueId,
    this.questionCode,
    this.questionText,
    this.sortOrder,
    this.responseType,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || valueId != null) {
      map['value_id'] = Variable<String>(valueId);
    }
    if (!nullToAbsent || questionCode != null) {
      map['question_code'] = Variable<String>(questionCode);
    }
    if (!nullToAbsent || questionText != null) {
      map['question_text'] = Variable<String>(questionText);
    }
    if (!nullToAbsent || sortOrder != null) {
      map['sort_order'] = Variable<int>(sortOrder);
    }
    if (!nullToAbsent || responseType != null) {
      map['response_type'] = Variable<String>(responseType);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  ValueQuestionsCompanion toCompanion(bool nullToAbsent) {
    return ValueQuestionsCompanion(
      id: Value(id),
      valueId: valueId == null && nullToAbsent
          ? const Value.absent()
          : Value(valueId),
      questionCode: questionCode == null && nullToAbsent
          ? const Value.absent()
          : Value(questionCode),
      questionText: questionText == null && nullToAbsent
          ? const Value.absent()
          : Value(questionText),
      sortOrder: sortOrder == null && nullToAbsent
          ? const Value.absent()
          : Value(sortOrder),
      responseType: responseType == null && nullToAbsent
          ? const Value.absent()
          : Value(responseType),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory QuestionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return QuestionRow(
      id: serializer.fromJson<String>(json['id']),
      valueId: serializer.fromJson<String?>(json['valueId']),
      questionCode: serializer.fromJson<String?>(json['questionCode']),
      questionText: serializer.fromJson<String?>(json['questionText']),
      sortOrder: serializer.fromJson<int?>(json['sortOrder']),
      responseType: serializer.fromJson<String?>(json['responseType']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'valueId': serializer.toJson<String?>(valueId),
      'questionCode': serializer.toJson<String?>(questionCode),
      'questionText': serializer.toJson<String?>(questionText),
      'sortOrder': serializer.toJson<int?>(sortOrder),
      'responseType': serializer.toJson<String?>(responseType),
      'status': serializer.toJson<String?>(status),
    };
  }

  QuestionRow copyWith({
    String? id,
    Value<String?> valueId = const Value.absent(),
    Value<String?> questionCode = const Value.absent(),
    Value<String?> questionText = const Value.absent(),
    Value<int?> sortOrder = const Value.absent(),
    Value<String?> responseType = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => QuestionRow(
    id: id ?? this.id,
    valueId: valueId.present ? valueId.value : this.valueId,
    questionCode: questionCode.present ? questionCode.value : this.questionCode,
    questionText: questionText.present ? questionText.value : this.questionText,
    sortOrder: sortOrder.present ? sortOrder.value : this.sortOrder,
    responseType: responseType.present ? responseType.value : this.responseType,
    status: status.present ? status.value : this.status,
  );
  QuestionRow copyWithCompanion(ValueQuestionsCompanion data) {
    return QuestionRow(
      id: data.id.present ? data.id.value : this.id,
      valueId: data.valueId.present ? data.valueId.value : this.valueId,
      questionCode: data.questionCode.present
          ? data.questionCode.value
          : this.questionCode,
      questionText: data.questionText.present
          ? data.questionText.value
          : this.questionText,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      responseType: data.responseType.present
          ? data.responseType.value
          : this.responseType,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('QuestionRow(')
          ..write('id: $id, ')
          ..write('valueId: $valueId, ')
          ..write('questionCode: $questionCode, ')
          ..write('questionText: $questionText, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('responseType: $responseType, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    valueId,
    questionCode,
    questionText,
    sortOrder,
    responseType,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is QuestionRow &&
          other.id == this.id &&
          other.valueId == this.valueId &&
          other.questionCode == this.questionCode &&
          other.questionText == this.questionText &&
          other.sortOrder == this.sortOrder &&
          other.responseType == this.responseType &&
          other.status == this.status);
}

class ValueQuestionsCompanion extends UpdateCompanion<QuestionRow> {
  final Value<String> id;
  final Value<String?> valueId;
  final Value<String?> questionCode;
  final Value<String?> questionText;
  final Value<int?> sortOrder;
  final Value<String?> responseType;
  final Value<String?> status;
  final Value<int> rowid;
  const ValueQuestionsCompanion({
    this.id = const Value.absent(),
    this.valueId = const Value.absent(),
    this.questionCode = const Value.absent(),
    this.questionText = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.responseType = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ValueQuestionsCompanion.insert({
    required String id,
    this.valueId = const Value.absent(),
    this.questionCode = const Value.absent(),
    this.questionText = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.responseType = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<QuestionRow> custom({
    Expression<String>? id,
    Expression<String>? valueId,
    Expression<String>? questionCode,
    Expression<String>? questionText,
    Expression<int>? sortOrder,
    Expression<String>? responseType,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (valueId != null) 'value_id': valueId,
      if (questionCode != null) 'question_code': questionCode,
      if (questionText != null) 'question_text': questionText,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (responseType != null) 'response_type': responseType,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ValueQuestionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? valueId,
    Value<String?>? questionCode,
    Value<String?>? questionText,
    Value<int?>? sortOrder,
    Value<String?>? responseType,
    Value<String?>? status,
    Value<int>? rowid,
  }) {
    return ValueQuestionsCompanion(
      id: id ?? this.id,
      valueId: valueId ?? this.valueId,
      questionCode: questionCode ?? this.questionCode,
      questionText: questionText ?? this.questionText,
      sortOrder: sortOrder ?? this.sortOrder,
      responseType: responseType ?? this.responseType,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (valueId.present) {
      map['value_id'] = Variable<String>(valueId.value);
    }
    if (questionCode.present) {
      map['question_code'] = Variable<String>(questionCode.value);
    }
    if (questionText.present) {
      map['question_text'] = Variable<String>(questionText.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (responseType.present) {
      map['response_type'] = Variable<String>(responseType.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ValueQuestionsCompanion(')
          ..write('id: $id, ')
          ..write('valueId: $valueId, ')
          ..write('questionCode: $questionCode, ')
          ..write('questionText: $questionText, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('responseType: $responseType, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrganizationsTable extends Organizations
    with TableInfo<$OrganizationsTable, OrganizationRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrganizationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryCodeMeta = const VerificationMeta(
    'countryCode',
  );
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
    'country_code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryNameMeta = const VerificationMeta(
    'countryName',
  );
  @override
  late final GeneratedColumn<String> countryName = GeneratedColumn<String>(
    'country_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  @override
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
    'region',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    kind,
    countryCode,
    countryName,
    region,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'organizations';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrganizationRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('country_code')) {
      context.handle(
        _countryCodeMeta,
        countryCode.isAcceptableOrUnknown(
          data['country_code']!,
          _countryCodeMeta,
        ),
      );
    }
    if (data.containsKey('country_name')) {
      context.handle(
        _countryNameMeta,
        countryName.isAcceptableOrUnknown(
          data['country_name']!,
          _countryNameMeta,
        ),
      );
    }
    if (data.containsKey('region')) {
      context.handle(
        _regionMeta,
        region.isAcceptableOrUnknown(data['region']!, _regionMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrganizationRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrganizationRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      ),
      countryCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_code'],
      ),
      countryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country_name'],
      ),
      region: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}region'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
    );
  }

  @override
  $OrganizationsTable createAlias(String alias) {
    return $OrganizationsTable(attachedDatabase, alias);
  }
}

class OrganizationRow extends DataClass implements Insertable<OrganizationRow> {
  final String id;
  final String? name;
  final String? kind;
  final String? countryCode;
  final String? countryName;
  final String? region;
  final String? status;
  const OrganizationRow({
    required this.id,
    this.name,
    this.kind,
    this.countryCode,
    this.countryName,
    this.region,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || kind != null) {
      map['kind'] = Variable<String>(kind);
    }
    if (!nullToAbsent || countryCode != null) {
      map['country_code'] = Variable<String>(countryCode);
    }
    if (!nullToAbsent || countryName != null) {
      map['country_name'] = Variable<String>(countryName);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  OrganizationsCompanion toCompanion(bool nullToAbsent) {
    return OrganizationsCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      kind: kind == null && nullToAbsent ? const Value.absent() : Value(kind),
      countryCode: countryCode == null && nullToAbsent
          ? const Value.absent()
          : Value(countryCode),
      countryName: countryName == null && nullToAbsent
          ? const Value.absent()
          : Value(countryName),
      region: region == null && nullToAbsent
          ? const Value.absent()
          : Value(region),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory OrganizationRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrganizationRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      kind: serializer.fromJson<String?>(json['kind']),
      countryCode: serializer.fromJson<String?>(json['countryCode']),
      countryName: serializer.fromJson<String?>(json['countryName']),
      region: serializer.fromJson<String?>(json['region']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'kind': serializer.toJson<String?>(kind),
      'countryCode': serializer.toJson<String?>(countryCode),
      'countryName': serializer.toJson<String?>(countryName),
      'region': serializer.toJson<String?>(region),
      'status': serializer.toJson<String?>(status),
    };
  }

  OrganizationRow copyWith({
    String? id,
    Value<String?> name = const Value.absent(),
    Value<String?> kind = const Value.absent(),
    Value<String?> countryCode = const Value.absent(),
    Value<String?> countryName = const Value.absent(),
    Value<String?> region = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => OrganizationRow(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    kind: kind.present ? kind.value : this.kind,
    countryCode: countryCode.present ? countryCode.value : this.countryCode,
    countryName: countryName.present ? countryName.value : this.countryName,
    region: region.present ? region.value : this.region,
    status: status.present ? status.value : this.status,
  );
  OrganizationRow copyWithCompanion(OrganizationsCompanion data) {
    return OrganizationRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      kind: data.kind.present ? data.kind.value : this.kind,
      countryCode: data.countryCode.present
          ? data.countryCode.value
          : this.countryCode,
      countryName: data.countryName.present
          ? data.countryName.value
          : this.countryName,
      region: data.region.present ? data.region.value : this.region,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('countryCode: $countryCode, ')
          ..write('countryName: $countryName, ')
          ..write('region: $region, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, kind, countryCode, countryName, region, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrganizationRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.kind == this.kind &&
          other.countryCode == this.countryCode &&
          other.countryName == this.countryName &&
          other.region == this.region &&
          other.status == this.status);
}

class OrganizationsCompanion extends UpdateCompanion<OrganizationRow> {
  final Value<String> id;
  final Value<String?> name;
  final Value<String?> kind;
  final Value<String?> countryCode;
  final Value<String?> countryName;
  final Value<String?> region;
  final Value<String?> status;
  final Value<int> rowid;
  const OrganizationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.countryName = const Value.absent(),
    this.region = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrganizationsCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.kind = const Value.absent(),
    this.countryCode = const Value.absent(),
    this.countryName = const Value.absent(),
    this.region = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<OrganizationRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? kind,
    Expression<String>? countryCode,
    Expression<String>? countryName,
    Expression<String>? region,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (kind != null) 'kind': kind,
      if (countryCode != null) 'country_code': countryCode,
      if (countryName != null) 'country_name': countryName,
      if (region != null) 'region': region,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrganizationsCompanion copyWith({
    Value<String>? id,
    Value<String?>? name,
    Value<String?>? kind,
    Value<String?>? countryCode,
    Value<String?>? countryName,
    Value<String?>? region,
    Value<String?>? status,
    Value<int>? rowid,
  }) {
    return OrganizationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      kind: kind ?? this.kind,
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
      region: region ?? this.region,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (countryName.present) {
      map['country_name'] = Variable<String>(countryName.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrganizationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('kind: $kind, ')
          ..write('countryCode: $countryCode, ')
          ..write('countryName: $countryName, ')
          ..write('region: $region, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PeopleTable extends People with TableInfo<$PeopleTable, PersonRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PeopleTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _positionMeta = const VerificationMeta(
    'position',
  );
  @override
  late final GeneratedColumn<String> position = GeneratedColumn<String>(
    'position',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    firstName,
    lastName,
    position,
    email,
    phone,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'people';
  @override
  VerificationContext validateIntegrity(
    Insertable<PersonRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    if (data.containsKey('position')) {
      context.handle(
        _positionMeta,
        position.isAcceptableOrUnknown(data['position']!, _positionMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PersonRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PersonRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
      position: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}position'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
    );
  }

  @override
  $PeopleTable createAlias(String alias) {
    return $PeopleTable(attachedDatabase, alias);
  }
}

class PersonRow extends DataClass implements Insertable<PersonRow> {
  final String id;
  final String? organizationId;
  final String? firstName;
  final String? lastName;
  final String? position;
  final String? email;
  final String? phone;
  final String? status;
  const PersonRow({
    required this.id,
    this.organizationId,
    this.firstName,
    this.lastName,
    this.position,
    this.email,
    this.phone,
    this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<String>(position);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    return map;
  }

  PeopleCompanion toCompanion(bool nullToAbsent) {
    return PeopleCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
    );
  }

  factory PersonRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PersonRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      position: serializer.fromJson<String?>(json['position']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      status: serializer.fromJson<String?>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
      'position': serializer.toJson<String?>(position),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'status': serializer.toJson<String?>(status),
    };
  }

  PersonRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> firstName = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
    Value<String?> position = const Value.absent(),
    Value<String?> email = const Value.absent(),
    Value<String?> phone = const Value.absent(),
    Value<String?> status = const Value.absent(),
  }) => PersonRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    firstName: firstName.present ? firstName.value : this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
    position: position.present ? position.value : this.position,
    email: email.present ? email.value : this.email,
    phone: phone.present ? phone.value : this.phone,
    status: status.present ? status.value : this.status,
  );
  PersonRow copyWithCompanion(PeopleCompanion data) {
    return PersonRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      position: data.position.present ? data.position.value : this.position,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PersonRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('position: $position, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    firstName,
    lastName,
    position,
    email,
    phone,
    status,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PersonRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.position == this.position &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.status == this.status);
}

class PeopleCompanion extends UpdateCompanion<PersonRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<String?> position;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> status;
  final Value<int> rowid;
  const PeopleCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.position = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PeopleCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.position = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<PersonRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? position,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (position != null) 'position': position,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PeopleCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? firstName,
    Value<String?>? lastName,
    Value<String?>? position,
    Value<String?>? email,
    Value<String?>? phone,
    Value<String?>? status,
    Value<int>? rowid,
  }) {
    return PeopleCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      position: position ?? this.position,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (position.present) {
      map['position'] = Variable<String>(position.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PeopleCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('position: $position, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RoundTablesTable extends RoundTables
    with TableInfo<$RoundTablesTable, RoundTableRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoundTablesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationIdMeta = const VerificationMeta(
    'locationId',
  );
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
    'location_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<int> weekday = GeneratedColumn<int>(
    'weekday',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timezoneMeta = const VerificationMeta(
    'timezone',
  );
  @override
  late final GeneratedColumn<String> timezone = GeneratedColumn<String>(
    'timezone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currentValueIdMeta = const VerificationMeta(
    'currentValueId',
  );
  @override
  late final GeneratedColumn<String> currentValueId = GeneratedColumn<String>(
    'current_value_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    locationId,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
    currentValueId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'round_tables';
  @override
  VerificationContext validateIntegrity(
    Insertable<RoundTableRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('location_id')) {
      context.handle(
        _locationIdMeta,
        locationId.isAcceptableOrUnknown(data['location_id']!, _locationIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    }
    if (data.containsKey('timezone')) {
      context.handle(
        _timezoneMeta,
        timezone.isAcceptableOrUnknown(data['timezone']!, _timezoneMeta),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('current_value_id')) {
      context.handle(
        _currentValueIdMeta,
        currentValueId.isAcceptableOrUnknown(
          data['current_value_id']!,
          _currentValueIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RoundTableRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RoundTableRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      locationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      weekday: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekday'],
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}start_time'],
      ),
      timezone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}timezone'],
      ),
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      currentValueId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_value_id'],
      ),
    );
  }

  @override
  $RoundTablesTable createAlias(String alias) {
    return $RoundTablesTable(attachedDatabase, alias);
  }
}

class RoundTableRow extends DataClass implements Insertable<RoundTableRow> {
  final String id;
  final String? organizationId;
  final String? locationId;
  final String? name;
  final String? code;
  final int? weekday;
  final String? startTime;
  final String? timezone;
  final int? durationMinutes;
  final String? status;
  final String? currentValueId;
  const RoundTableRow({
    required this.id,
    this.organizationId,
    this.locationId,
    this.name,
    this.code,
    this.weekday,
    this.startTime,
    this.timezone,
    this.durationMinutes,
    this.status,
    this.currentValueId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || locationId != null) {
      map['location_id'] = Variable<String>(locationId);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || weekday != null) {
      map['weekday'] = Variable<int>(weekday);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || timezone != null) {
      map['timezone'] = Variable<String>(timezone);
    }
    if (!nullToAbsent || durationMinutes != null) {
      map['duration_minutes'] = Variable<int>(durationMinutes);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || currentValueId != null) {
      map['current_value_id'] = Variable<String>(currentValueId);
    }
    return map;
  }

  RoundTablesCompanion toCompanion(bool nullToAbsent) {
    return RoundTablesCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      locationId: locationId == null && nullToAbsent
          ? const Value.absent()
          : Value(locationId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      weekday: weekday == null && nullToAbsent
          ? const Value.absent()
          : Value(weekday),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      timezone: timezone == null && nullToAbsent
          ? const Value.absent()
          : Value(timezone),
      durationMinutes: durationMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(durationMinutes),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      currentValueId: currentValueId == null && nullToAbsent
          ? const Value.absent()
          : Value(currentValueId),
    );
  }

  factory RoundTableRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RoundTableRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      locationId: serializer.fromJson<String?>(json['locationId']),
      name: serializer.fromJson<String?>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      weekday: serializer.fromJson<int?>(json['weekday']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      timezone: serializer.fromJson<String?>(json['timezone']),
      durationMinutes: serializer.fromJson<int?>(json['durationMinutes']),
      status: serializer.fromJson<String?>(json['status']),
      currentValueId: serializer.fromJson<String?>(json['currentValueId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'locationId': serializer.toJson<String?>(locationId),
      'name': serializer.toJson<String?>(name),
      'code': serializer.toJson<String?>(code),
      'weekday': serializer.toJson<int?>(weekday),
      'startTime': serializer.toJson<String?>(startTime),
      'timezone': serializer.toJson<String?>(timezone),
      'durationMinutes': serializer.toJson<int?>(durationMinutes),
      'status': serializer.toJson<String?>(status),
      'currentValueId': serializer.toJson<String?>(currentValueId),
    };
  }

  RoundTableRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> locationId = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> code = const Value.absent(),
    Value<int?> weekday = const Value.absent(),
    Value<String?> startTime = const Value.absent(),
    Value<String?> timezone = const Value.absent(),
    Value<int?> durationMinutes = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> currentValueId = const Value.absent(),
  }) => RoundTableRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    locationId: locationId.present ? locationId.value : this.locationId,
    name: name.present ? name.value : this.name,
    code: code.present ? code.value : this.code,
    weekday: weekday.present ? weekday.value : this.weekday,
    startTime: startTime.present ? startTime.value : this.startTime,
    timezone: timezone.present ? timezone.value : this.timezone,
    durationMinutes: durationMinutes.present
        ? durationMinutes.value
        : this.durationMinutes,
    status: status.present ? status.value : this.status,
    currentValueId: currentValueId.present
        ? currentValueId.value
        : this.currentValueId,
  );
  RoundTableRow copyWithCompanion(RoundTablesCompanion data) {
    return RoundTableRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      locationId: data.locationId.present
          ? data.locationId.value
          : this.locationId,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      timezone: data.timezone.present ? data.timezone.value : this.timezone,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
      status: data.status.present ? data.status.value : this.status,
      currentValueId: data.currentValueId.present
          ? data.currentValueId.value
          : this.currentValueId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RoundTableRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('locationId: $locationId, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('weekday: $weekday, ')
          ..write('startTime: $startTime, ')
          ..write('timezone: $timezone, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('status: $status, ')
          ..write('currentValueId: $currentValueId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    locationId,
    name,
    code,
    weekday,
    startTime,
    timezone,
    durationMinutes,
    status,
    currentValueId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoundTableRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.locationId == this.locationId &&
          other.name == this.name &&
          other.code == this.code &&
          other.weekday == this.weekday &&
          other.startTime == this.startTime &&
          other.timezone == this.timezone &&
          other.durationMinutes == this.durationMinutes &&
          other.status == this.status &&
          other.currentValueId == this.currentValueId);
}

class RoundTablesCompanion extends UpdateCompanion<RoundTableRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> locationId;
  final Value<String?> name;
  final Value<String?> code;
  final Value<int?> weekday;
  final Value<String?> startTime;
  final Value<String?> timezone;
  final Value<int?> durationMinutes;
  final Value<String?> status;
  final Value<String?> currentValueId;
  final Value<int> rowid;
  const RoundTablesCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.weekday = const Value.absent(),
    this.startTime = const Value.absent(),
    this.timezone = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.status = const Value.absent(),
    this.currentValueId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoundTablesCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.weekday = const Value.absent(),
    this.startTime = const Value.absent(),
    this.timezone = const Value.absent(),
    this.durationMinutes = const Value.absent(),
    this.status = const Value.absent(),
    this.currentValueId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<RoundTableRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? locationId,
    Expression<String>? name,
    Expression<String>? code,
    Expression<int>? weekday,
    Expression<String>? startTime,
    Expression<String>? timezone,
    Expression<int>? durationMinutes,
    Expression<String>? status,
    Expression<String>? currentValueId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (locationId != null) 'location_id': locationId,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (weekday != null) 'weekday': weekday,
      if (startTime != null) 'start_time': startTime,
      if (timezone != null) 'timezone': timezone,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
      if (status != null) 'status': status,
      if (currentValueId != null) 'current_value_id': currentValueId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoundTablesCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? locationId,
    Value<String?>? name,
    Value<String?>? code,
    Value<int?>? weekday,
    Value<String?>? startTime,
    Value<String?>? timezone,
    Value<int?>? durationMinutes,
    Value<String?>? status,
    Value<String?>? currentValueId,
    Value<int>? rowid,
  }) {
    return RoundTablesCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      locationId: locationId ?? this.locationId,
      name: name ?? this.name,
      code: code ?? this.code,
      weekday: weekday ?? this.weekday,
      startTime: startTime ?? this.startTime,
      timezone: timezone ?? this.timezone,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      status: status ?? this.status,
      currentValueId: currentValueId ?? this.currentValueId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<int>(weekday.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (timezone.present) {
      map['timezone'] = Variable<String>(timezone.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (currentValueId.present) {
      map['current_value_id'] = Variable<String>(currentValueId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoundTablesCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('locationId: $locationId, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('weekday: $weekday, ')
          ..write('startTime: $startTime, ')
          ..write('timezone: $timezone, ')
          ..write('durationMinutes: $durationMinutes, ')
          ..write('status: $status, ')
          ..write('currentValueId: $currentValueId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TableMembersTable extends TableMembers
    with TableInfo<$TableMembersTable, TableMemberRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TableMembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roundTableIdMeta = const VerificationMeta(
    'roundTableId',
  );
  @override
  late final GeneratedColumn<String> roundTableId = GeneratedColumn<String>(
    'round_table_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _joinedAtMeta = const VerificationMeta(
    'joinedAt',
  );
  @override
  late final GeneratedColumn<String> joinedAt = GeneratedColumn<String>(
    'joined_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _leftAtMeta = const VerificationMeta('leftAt');
  @override
  late final GeneratedColumn<String> leftAt = GeneratedColumn<String>(
    'left_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _leftReasonMeta = const VerificationMeta(
    'leftReason',
  );
  @override
  late final GeneratedColumn<String> leftReason = GeneratedColumn<String>(
    'left_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    roundTableId,
    personId,
    role,
    joinedAt,
    leftAt,
    leftReason,
    status,
    firstName,
    lastName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'table_members';
  @override
  VerificationContext validateIntegrity(
    Insertable<TableMemberRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('round_table_id')) {
      context.handle(
        _roundTableIdMeta,
        roundTableId.isAcceptableOrUnknown(
          data['round_table_id']!,
          _roundTableIdMeta,
        ),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    }
    if (data.containsKey('joined_at')) {
      context.handle(
        _joinedAtMeta,
        joinedAt.isAcceptableOrUnknown(data['joined_at']!, _joinedAtMeta),
      );
    }
    if (data.containsKey('left_at')) {
      context.handle(
        _leftAtMeta,
        leftAt.isAcceptableOrUnknown(data['left_at']!, _leftAtMeta),
      );
    }
    if (data.containsKey('left_reason')) {
      context.handle(
        _leftReasonMeta,
        leftReason.isAcceptableOrUnknown(data['left_reason']!, _leftReasonMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TableMemberRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TableMemberRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      roundTableId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_table_id'],
      ),
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      ),
      joinedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}joined_at'],
      ),
      leftAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}left_at'],
      ),
      leftReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}left_reason'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      ),
    );
  }

  @override
  $TableMembersTable createAlias(String alias) {
    return $TableMembersTable(attachedDatabase, alias);
  }
}

class TableMemberRow extends DataClass implements Insertable<TableMemberRow> {
  final String id;
  final String? organizationId;
  final String? roundTableId;
  final String? personId;
  final String? role;
  final String? joinedAt;
  final String? leftAt;
  final String? leftReason;
  final String? status;
  final String? firstName;
  final String? lastName;
  const TableMemberRow({
    required this.id,
    this.organizationId,
    this.roundTableId,
    this.personId,
    this.role,
    this.joinedAt,
    this.leftAt,
    this.leftReason,
    this.status,
    this.firstName,
    this.lastName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || roundTableId != null) {
      map['round_table_id'] = Variable<String>(roundTableId);
    }
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || role != null) {
      map['role'] = Variable<String>(role);
    }
    if (!nullToAbsent || joinedAt != null) {
      map['joined_at'] = Variable<String>(joinedAt);
    }
    if (!nullToAbsent || leftAt != null) {
      map['left_at'] = Variable<String>(leftAt);
    }
    if (!nullToAbsent || leftReason != null) {
      map['left_reason'] = Variable<String>(leftReason);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || lastName != null) {
      map['last_name'] = Variable<String>(lastName);
    }
    return map;
  }

  TableMembersCompanion toCompanion(bool nullToAbsent) {
    return TableMembersCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      roundTableId: roundTableId == null && nullToAbsent
          ? const Value.absent()
          : Value(roundTableId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      role: role == null && nullToAbsent ? const Value.absent() : Value(role),
      joinedAt: joinedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(joinedAt),
      leftAt: leftAt == null && nullToAbsent
          ? const Value.absent()
          : Value(leftAt),
      leftReason: leftReason == null && nullToAbsent
          ? const Value.absent()
          : Value(leftReason),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
    );
  }

  factory TableMemberRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TableMemberRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      roundTableId: serializer.fromJson<String?>(json['roundTableId']),
      personId: serializer.fromJson<String?>(json['personId']),
      role: serializer.fromJson<String?>(json['role']),
      joinedAt: serializer.fromJson<String?>(json['joinedAt']),
      leftAt: serializer.fromJson<String?>(json['leftAt']),
      leftReason: serializer.fromJson<String?>(json['leftReason']),
      status: serializer.fromJson<String?>(json['status']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'roundTableId': serializer.toJson<String?>(roundTableId),
      'personId': serializer.toJson<String?>(personId),
      'role': serializer.toJson<String?>(role),
      'joinedAt': serializer.toJson<String?>(joinedAt),
      'leftAt': serializer.toJson<String?>(leftAt),
      'leftReason': serializer.toJson<String?>(leftReason),
      'status': serializer.toJson<String?>(status),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String?>(lastName),
    };
  }

  TableMemberRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> roundTableId = const Value.absent(),
    Value<String?> personId = const Value.absent(),
    Value<String?> role = const Value.absent(),
    Value<String?> joinedAt = const Value.absent(),
    Value<String?> leftAt = const Value.absent(),
    Value<String?> leftReason = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> firstName = const Value.absent(),
    Value<String?> lastName = const Value.absent(),
  }) => TableMemberRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    roundTableId: roundTableId.present ? roundTableId.value : this.roundTableId,
    personId: personId.present ? personId.value : this.personId,
    role: role.present ? role.value : this.role,
    joinedAt: joinedAt.present ? joinedAt.value : this.joinedAt,
    leftAt: leftAt.present ? leftAt.value : this.leftAt,
    leftReason: leftReason.present ? leftReason.value : this.leftReason,
    status: status.present ? status.value : this.status,
    firstName: firstName.present ? firstName.value : this.firstName,
    lastName: lastName.present ? lastName.value : this.lastName,
  );
  TableMemberRow copyWithCompanion(TableMembersCompanion data) {
    return TableMemberRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      roundTableId: data.roundTableId.present
          ? data.roundTableId.value
          : this.roundTableId,
      personId: data.personId.present ? data.personId.value : this.personId,
      role: data.role.present ? data.role.value : this.role,
      joinedAt: data.joinedAt.present ? data.joinedAt.value : this.joinedAt,
      leftAt: data.leftAt.present ? data.leftAt.value : this.leftAt,
      leftReason: data.leftReason.present
          ? data.leftReason.value
          : this.leftReason,
      status: data.status.present ? data.status.value : this.status,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TableMemberRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('personId: $personId, ')
          ..write('role: $role, ')
          ..write('joinedAt: $joinedAt, ')
          ..write('leftAt: $leftAt, ')
          ..write('leftReason: $leftReason, ')
          ..write('status: $status, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    roundTableId,
    personId,
    role,
    joinedAt,
    leftAt,
    leftReason,
    status,
    firstName,
    lastName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableMemberRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.roundTableId == this.roundTableId &&
          other.personId == this.personId &&
          other.role == this.role &&
          other.joinedAt == this.joinedAt &&
          other.leftAt == this.leftAt &&
          other.leftReason == this.leftReason &&
          other.status == this.status &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName);
}

class TableMembersCompanion extends UpdateCompanion<TableMemberRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> roundTableId;
  final Value<String?> personId;
  final Value<String?> role;
  final Value<String?> joinedAt;
  final Value<String?> leftAt;
  final Value<String?> leftReason;
  final Value<String?> status;
  final Value<String?> firstName;
  final Value<String?> lastName;
  final Value<int> rowid;
  const TableMembersCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.personId = const Value.absent(),
    this.role = const Value.absent(),
    this.joinedAt = const Value.absent(),
    this.leftAt = const Value.absent(),
    this.leftReason = const Value.absent(),
    this.status = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TableMembersCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.personId = const Value.absent(),
    this.role = const Value.absent(),
    this.joinedAt = const Value.absent(),
    this.leftAt = const Value.absent(),
    this.leftReason = const Value.absent(),
    this.status = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<TableMemberRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? roundTableId,
    Expression<String>? personId,
    Expression<String>? role,
    Expression<String>? joinedAt,
    Expression<String>? leftAt,
    Expression<String>? leftReason,
    Expression<String>? status,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (roundTableId != null) 'round_table_id': roundTableId,
      if (personId != null) 'person_id': personId,
      if (role != null) 'role': role,
      if (joinedAt != null) 'joined_at': joinedAt,
      if (leftAt != null) 'left_at': leftAt,
      if (leftReason != null) 'left_reason': leftReason,
      if (status != null) 'status': status,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TableMembersCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? roundTableId,
    Value<String?>? personId,
    Value<String?>? role,
    Value<String?>? joinedAt,
    Value<String?>? leftAt,
    Value<String?>? leftReason,
    Value<String?>? status,
    Value<String?>? firstName,
    Value<String?>? lastName,
    Value<int>? rowid,
  }) {
    return TableMembersCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      roundTableId: roundTableId ?? this.roundTableId,
      personId: personId ?? this.personId,
      role: role ?? this.role,
      joinedAt: joinedAt ?? this.joinedAt,
      leftAt: leftAt ?? this.leftAt,
      leftReason: leftReason ?? this.leftReason,
      status: status ?? this.status,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (roundTableId.present) {
      map['round_table_id'] = Variable<String>(roundTableId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (joinedAt.present) {
      map['joined_at'] = Variable<String>(joinedAt.value);
    }
    if (leftAt.present) {
      map['left_at'] = Variable<String>(leftAt.value);
    }
    if (leftReason.present) {
      map['left_reason'] = Variable<String>(leftReason.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableMembersCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('personId: $personId, ')
          ..write('role: $role, ')
          ..write('joinedAt: $joinedAt, ')
          ..write('leftAt: $leftAt, ')
          ..write('leftReason: $leftReason, ')
          ..write('status: $status, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionsTable extends Sessions
    with TableInfo<$SessionsTable, SessionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roundTableIdMeta = const VerificationMeta(
    'roundTableId',
  );
  @override
  late final GeneratedColumn<String> roundTableId = GeneratedColumn<String>(
    'round_table_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueIdMeta = const VerificationMeta(
    'valueId',
  );
  @override
  late final GeneratedColumn<String> valueId = GeneratedColumn<String>(
    'value_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpValueIdMeta = const VerificationMeta(
    'followUpValueId',
  );
  @override
  late final GeneratedColumn<String> followUpValueId = GeneratedColumn<String>(
    'follow_up_value_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stageMeta = const VerificationMeta('stage');
  @override
  late final GeneratedColumn<String> stage = GeneratedColumn<String>(
    'stage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scheduledAtMeta = const VerificationMeta(
    'scheduledAt',
  );
  @override
  late final GeneratedColumn<String> scheduledAt = GeneratedColumn<String>(
    'scheduled_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<String> startedAt = GeneratedColumn<String>(
    'started_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endedAtMeta = const VerificationMeta(
    'endedAt',
  );
  @override
  late final GeneratedColumn<String> endedAt = GeneratedColumn<String>(
    'ended_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _answersClosedAtMeta = const VerificationMeta(
    'answersClosedAt',
  );
  @override
  late final GeneratedColumn<String> answersClosedAt = GeneratedColumn<String>(
    'answers_closed_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cancelledReasonMeta = const VerificationMeta(
    'cancelledReason',
  );
  @override
  late final GeneratedColumn<String> cancelledReason = GeneratedColumn<String>(
    'cancelled_reason',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _facilitatorPersonIdMeta =
      const VerificationMeta('facilitatorPersonId');
  @override
  late final GeneratedColumn<String> facilitatorPersonId =
      GeneratedColumn<String>(
        'facilitator_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _deviceModifiedAtMeta = const VerificationMeta(
    'deviceModifiedAt',
  );
  @override
  late final GeneratedColumn<String> deviceModifiedAt = GeneratedColumn<String>(
    'device_modified_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<String> archivedAt = GeneratedColumn<String>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    roundTableId,
    valueId,
    followUpValueId,
    status,
    stage,
    scheduledAt,
    startedAt,
    endedAt,
    answersClosedAt,
    cancelledReason,
    facilitatorPersonId,
    deviceModifiedAt,
    archivedAt,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SessionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('round_table_id')) {
      context.handle(
        _roundTableIdMeta,
        roundTableId.isAcceptableOrUnknown(
          data['round_table_id']!,
          _roundTableIdMeta,
        ),
      );
    }
    if (data.containsKey('value_id')) {
      context.handle(
        _valueIdMeta,
        valueId.isAcceptableOrUnknown(data['value_id']!, _valueIdMeta),
      );
    }
    if (data.containsKey('follow_up_value_id')) {
      context.handle(
        _followUpValueIdMeta,
        followUpValueId.isAcceptableOrUnknown(
          data['follow_up_value_id']!,
          _followUpValueIdMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('stage')) {
      context.handle(
        _stageMeta,
        stage.isAcceptableOrUnknown(data['stage']!, _stageMeta),
      );
    }
    if (data.containsKey('scheduled_at')) {
      context.handle(
        _scheduledAtMeta,
        scheduledAt.isAcceptableOrUnknown(
          data['scheduled_at']!,
          _scheduledAtMeta,
        ),
      );
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    }
    if (data.containsKey('ended_at')) {
      context.handle(
        _endedAtMeta,
        endedAt.isAcceptableOrUnknown(data['ended_at']!, _endedAtMeta),
      );
    }
    if (data.containsKey('answers_closed_at')) {
      context.handle(
        _answersClosedAtMeta,
        answersClosedAt.isAcceptableOrUnknown(
          data['answers_closed_at']!,
          _answersClosedAtMeta,
        ),
      );
    }
    if (data.containsKey('cancelled_reason')) {
      context.handle(
        _cancelledReasonMeta,
        cancelledReason.isAcceptableOrUnknown(
          data['cancelled_reason']!,
          _cancelledReasonMeta,
        ),
      );
    }
    if (data.containsKey('facilitator_person_id')) {
      context.handle(
        _facilitatorPersonIdMeta,
        facilitatorPersonId.isAcceptableOrUnknown(
          data['facilitator_person_id']!,
          _facilitatorPersonIdMeta,
        ),
      );
    }
    if (data.containsKey('device_modified_at')) {
      context.handle(
        _deviceModifiedAtMeta,
        deviceModifiedAt.isAcceptableOrUnknown(
          data['device_modified_at']!,
          _deviceModifiedAtMeta,
        ),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SessionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SessionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      roundTableId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_table_id'],
      ),
      valueId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_id'],
      ),
      followUpValueId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_value_id'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      stage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stage'],
      ),
      scheduledAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}scheduled_at'],
      ),
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}started_at'],
      ),
      endedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ended_at'],
      ),
      answersClosedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answers_closed_at'],
      ),
      cancelledReason: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cancelled_reason'],
      ),
      facilitatorPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}facilitator_person_id'],
      ),
      deviceModifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_modified_at'],
      ),
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archived_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
    );
  }

  @override
  $SessionsTable createAlias(String alias) {
    return $SessionsTable(attachedDatabase, alias);
  }
}

class SessionRow extends DataClass implements Insertable<SessionRow> {
  final String id;
  final String? organizationId;
  final String? roundTableId;
  final String? valueId;
  final String? followUpValueId;
  final String? status;
  final String? stage;
  final String? scheduledAt;
  final String? startedAt;
  final String? endedAt;
  final String? answersClosedAt;
  final String? cancelledReason;
  final String? facilitatorPersonId;
  final String? deviceModifiedAt;
  final String? archivedAt;
  final String? createdAt;
  final String? updatedAt;
  const SessionRow({
    required this.id,
    this.organizationId,
    this.roundTableId,
    this.valueId,
    this.followUpValueId,
    this.status,
    this.stage,
    this.scheduledAt,
    this.startedAt,
    this.endedAt,
    this.answersClosedAt,
    this.cancelledReason,
    this.facilitatorPersonId,
    this.deviceModifiedAt,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || roundTableId != null) {
      map['round_table_id'] = Variable<String>(roundTableId);
    }
    if (!nullToAbsent || valueId != null) {
      map['value_id'] = Variable<String>(valueId);
    }
    if (!nullToAbsent || followUpValueId != null) {
      map['follow_up_value_id'] = Variable<String>(followUpValueId);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || stage != null) {
      map['stage'] = Variable<String>(stage);
    }
    if (!nullToAbsent || scheduledAt != null) {
      map['scheduled_at'] = Variable<String>(scheduledAt);
    }
    if (!nullToAbsent || startedAt != null) {
      map['started_at'] = Variable<String>(startedAt);
    }
    if (!nullToAbsent || endedAt != null) {
      map['ended_at'] = Variable<String>(endedAt);
    }
    if (!nullToAbsent || answersClosedAt != null) {
      map['answers_closed_at'] = Variable<String>(answersClosedAt);
    }
    if (!nullToAbsent || cancelledReason != null) {
      map['cancelled_reason'] = Variable<String>(cancelledReason);
    }
    if (!nullToAbsent || facilitatorPersonId != null) {
      map['facilitator_person_id'] = Variable<String>(facilitatorPersonId);
    }
    if (!nullToAbsent || deviceModifiedAt != null) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt);
    }
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<String>(archivedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    return map;
  }

  SessionsCompanion toCompanion(bool nullToAbsent) {
    return SessionsCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      roundTableId: roundTableId == null && nullToAbsent
          ? const Value.absent()
          : Value(roundTableId),
      valueId: valueId == null && nullToAbsent
          ? const Value.absent()
          : Value(valueId),
      followUpValueId: followUpValueId == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpValueId),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      stage: stage == null && nullToAbsent
          ? const Value.absent()
          : Value(stage),
      scheduledAt: scheduledAt == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduledAt),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      endedAt: endedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAt),
      answersClosedAt: answersClosedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(answersClosedAt),
      cancelledReason: cancelledReason == null && nullToAbsent
          ? const Value.absent()
          : Value(cancelledReason),
      facilitatorPersonId: facilitatorPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(facilitatorPersonId),
      deviceModifiedAt: deviceModifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceModifiedAt),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory SessionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SessionRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      roundTableId: serializer.fromJson<String?>(json['roundTableId']),
      valueId: serializer.fromJson<String?>(json['valueId']),
      followUpValueId: serializer.fromJson<String?>(json['followUpValueId']),
      status: serializer.fromJson<String?>(json['status']),
      stage: serializer.fromJson<String?>(json['stage']),
      scheduledAt: serializer.fromJson<String?>(json['scheduledAt']),
      startedAt: serializer.fromJson<String?>(json['startedAt']),
      endedAt: serializer.fromJson<String?>(json['endedAt']),
      answersClosedAt: serializer.fromJson<String?>(json['answersClosedAt']),
      cancelledReason: serializer.fromJson<String?>(json['cancelledReason']),
      facilitatorPersonId: serializer.fromJson<String?>(
        json['facilitatorPersonId'],
      ),
      deviceModifiedAt: serializer.fromJson<String?>(json['deviceModifiedAt']),
      archivedAt: serializer.fromJson<String?>(json['archivedAt']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'roundTableId': serializer.toJson<String?>(roundTableId),
      'valueId': serializer.toJson<String?>(valueId),
      'followUpValueId': serializer.toJson<String?>(followUpValueId),
      'status': serializer.toJson<String?>(status),
      'stage': serializer.toJson<String?>(stage),
      'scheduledAt': serializer.toJson<String?>(scheduledAt),
      'startedAt': serializer.toJson<String?>(startedAt),
      'endedAt': serializer.toJson<String?>(endedAt),
      'answersClosedAt': serializer.toJson<String?>(answersClosedAt),
      'cancelledReason': serializer.toJson<String?>(cancelledReason),
      'facilitatorPersonId': serializer.toJson<String?>(facilitatorPersonId),
      'deviceModifiedAt': serializer.toJson<String?>(deviceModifiedAt),
      'archivedAt': serializer.toJson<String?>(archivedAt),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
    };
  }

  SessionRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> roundTableId = const Value.absent(),
    Value<String?> valueId = const Value.absent(),
    Value<String?> followUpValueId = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> stage = const Value.absent(),
    Value<String?> scheduledAt = const Value.absent(),
    Value<String?> startedAt = const Value.absent(),
    Value<String?> endedAt = const Value.absent(),
    Value<String?> answersClosedAt = const Value.absent(),
    Value<String?> cancelledReason = const Value.absent(),
    Value<String?> facilitatorPersonId = const Value.absent(),
    Value<String?> deviceModifiedAt = const Value.absent(),
    Value<String?> archivedAt = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
  }) => SessionRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    roundTableId: roundTableId.present ? roundTableId.value : this.roundTableId,
    valueId: valueId.present ? valueId.value : this.valueId,
    followUpValueId: followUpValueId.present
        ? followUpValueId.value
        : this.followUpValueId,
    status: status.present ? status.value : this.status,
    stage: stage.present ? stage.value : this.stage,
    scheduledAt: scheduledAt.present ? scheduledAt.value : this.scheduledAt,
    startedAt: startedAt.present ? startedAt.value : this.startedAt,
    endedAt: endedAt.present ? endedAt.value : this.endedAt,
    answersClosedAt: answersClosedAt.present
        ? answersClosedAt.value
        : this.answersClosedAt,
    cancelledReason: cancelledReason.present
        ? cancelledReason.value
        : this.cancelledReason,
    facilitatorPersonId: facilitatorPersonId.present
        ? facilitatorPersonId.value
        : this.facilitatorPersonId,
    deviceModifiedAt: deviceModifiedAt.present
        ? deviceModifiedAt.value
        : this.deviceModifiedAt,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
  );
  SessionRow copyWithCompanion(SessionsCompanion data) {
    return SessionRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      roundTableId: data.roundTableId.present
          ? data.roundTableId.value
          : this.roundTableId,
      valueId: data.valueId.present ? data.valueId.value : this.valueId,
      followUpValueId: data.followUpValueId.present
          ? data.followUpValueId.value
          : this.followUpValueId,
      status: data.status.present ? data.status.value : this.status,
      stage: data.stage.present ? data.stage.value : this.stage,
      scheduledAt: data.scheduledAt.present
          ? data.scheduledAt.value
          : this.scheduledAt,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      endedAt: data.endedAt.present ? data.endedAt.value : this.endedAt,
      answersClosedAt: data.answersClosedAt.present
          ? data.answersClosedAt.value
          : this.answersClosedAt,
      cancelledReason: data.cancelledReason.present
          ? data.cancelledReason.value
          : this.cancelledReason,
      facilitatorPersonId: data.facilitatorPersonId.present
          ? data.facilitatorPersonId.value
          : this.facilitatorPersonId,
      deviceModifiedAt: data.deviceModifiedAt.present
          ? data.deviceModifiedAt.value
          : this.deviceModifiedAt,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SessionRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('valueId: $valueId, ')
          ..write('followUpValueId: $followUpValueId, ')
          ..write('status: $status, ')
          ..write('stage: $stage, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('answersClosedAt: $answersClosedAt, ')
          ..write('cancelledReason: $cancelledReason, ')
          ..write('facilitatorPersonId: $facilitatorPersonId, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    roundTableId,
    valueId,
    followUpValueId,
    status,
    stage,
    scheduledAt,
    startedAt,
    endedAt,
    answersClosedAt,
    cancelledReason,
    facilitatorPersonId,
    deviceModifiedAt,
    archivedAt,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.roundTableId == this.roundTableId &&
          other.valueId == this.valueId &&
          other.followUpValueId == this.followUpValueId &&
          other.status == this.status &&
          other.stage == this.stage &&
          other.scheduledAt == this.scheduledAt &&
          other.startedAt == this.startedAt &&
          other.endedAt == this.endedAt &&
          other.answersClosedAt == this.answersClosedAt &&
          other.cancelledReason == this.cancelledReason &&
          other.facilitatorPersonId == this.facilitatorPersonId &&
          other.deviceModifiedAt == this.deviceModifiedAt &&
          other.archivedAt == this.archivedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class SessionsCompanion extends UpdateCompanion<SessionRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> roundTableId;
  final Value<String?> valueId;
  final Value<String?> followUpValueId;
  final Value<String?> status;
  final Value<String?> stage;
  final Value<String?> scheduledAt;
  final Value<String?> startedAt;
  final Value<String?> endedAt;
  final Value<String?> answersClosedAt;
  final Value<String?> cancelledReason;
  final Value<String?> facilitatorPersonId;
  final Value<String?> deviceModifiedAt;
  final Value<String?> archivedAt;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<int> rowid;
  const SessionsCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.valueId = const Value.absent(),
    this.followUpValueId = const Value.absent(),
    this.status = const Value.absent(),
    this.stage = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.answersClosedAt = const Value.absent(),
    this.cancelledReason = const Value.absent(),
    this.facilitatorPersonId = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionsCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.valueId = const Value.absent(),
    this.followUpValueId = const Value.absent(),
    this.status = const Value.absent(),
    this.stage = const Value.absent(),
    this.scheduledAt = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.endedAt = const Value.absent(),
    this.answersClosedAt = const Value.absent(),
    this.cancelledReason = const Value.absent(),
    this.facilitatorPersonId = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<SessionRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? roundTableId,
    Expression<String>? valueId,
    Expression<String>? followUpValueId,
    Expression<String>? status,
    Expression<String>? stage,
    Expression<String>? scheduledAt,
    Expression<String>? startedAt,
    Expression<String>? endedAt,
    Expression<String>? answersClosedAt,
    Expression<String>? cancelledReason,
    Expression<String>? facilitatorPersonId,
    Expression<String>? deviceModifiedAt,
    Expression<String>? archivedAt,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (roundTableId != null) 'round_table_id': roundTableId,
      if (valueId != null) 'value_id': valueId,
      if (followUpValueId != null) 'follow_up_value_id': followUpValueId,
      if (status != null) 'status': status,
      if (stage != null) 'stage': stage,
      if (scheduledAt != null) 'scheduled_at': scheduledAt,
      if (startedAt != null) 'started_at': startedAt,
      if (endedAt != null) 'ended_at': endedAt,
      if (answersClosedAt != null) 'answers_closed_at': answersClosedAt,
      if (cancelledReason != null) 'cancelled_reason': cancelledReason,
      if (facilitatorPersonId != null)
        'facilitator_person_id': facilitatorPersonId,
      if (deviceModifiedAt != null) 'device_modified_at': deviceModifiedAt,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? roundTableId,
    Value<String?>? valueId,
    Value<String?>? followUpValueId,
    Value<String?>? status,
    Value<String?>? stage,
    Value<String?>? scheduledAt,
    Value<String?>? startedAt,
    Value<String?>? endedAt,
    Value<String?>? answersClosedAt,
    Value<String?>? cancelledReason,
    Value<String?>? facilitatorPersonId,
    Value<String?>? deviceModifiedAt,
    Value<String?>? archivedAt,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<int>? rowid,
  }) {
    return SessionsCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      roundTableId: roundTableId ?? this.roundTableId,
      valueId: valueId ?? this.valueId,
      followUpValueId: followUpValueId ?? this.followUpValueId,
      status: status ?? this.status,
      stage: stage ?? this.stage,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
      answersClosedAt: answersClosedAt ?? this.answersClosedAt,
      cancelledReason: cancelledReason ?? this.cancelledReason,
      facilitatorPersonId: facilitatorPersonId ?? this.facilitatorPersonId,
      deviceModifiedAt: deviceModifiedAt ?? this.deviceModifiedAt,
      archivedAt: archivedAt ?? this.archivedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (roundTableId.present) {
      map['round_table_id'] = Variable<String>(roundTableId.value);
    }
    if (valueId.present) {
      map['value_id'] = Variable<String>(valueId.value);
    }
    if (followUpValueId.present) {
      map['follow_up_value_id'] = Variable<String>(followUpValueId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (stage.present) {
      map['stage'] = Variable<String>(stage.value);
    }
    if (scheduledAt.present) {
      map['scheduled_at'] = Variable<String>(scheduledAt.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<String>(startedAt.value);
    }
    if (endedAt.present) {
      map['ended_at'] = Variable<String>(endedAt.value);
    }
    if (answersClosedAt.present) {
      map['answers_closed_at'] = Variable<String>(answersClosedAt.value);
    }
    if (cancelledReason.present) {
      map['cancelled_reason'] = Variable<String>(cancelledReason.value);
    }
    if (facilitatorPersonId.present) {
      map['facilitator_person_id'] = Variable<String>(
        facilitatorPersonId.value,
      );
    }
    if (deviceModifiedAt.present) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<String>(archivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionsCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('valueId: $valueId, ')
          ..write('followUpValueId: $followUpValueId, ')
          ..write('status: $status, ')
          ..write('stage: $stage, ')
          ..write('scheduledAt: $scheduledAt, ')
          ..write('startedAt: $startedAt, ')
          ..write('endedAt: $endedAt, ')
          ..write('answersClosedAt: $answersClosedAt, ')
          ..write('cancelledReason: $cancelledReason, ')
          ..write('facilitatorPersonId: $facilitatorPersonId, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SessionAttendanceTable extends SessionAttendance
    with TableInfo<$SessionAttendanceTable, AttendanceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SessionAttendanceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roundTableIdMeta = const VerificationMeta(
    'roundTableId',
  );
  @override
  late final GeneratedColumn<String> roundTableId = GeneratedColumn<String>(
    'round_table_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceCreatedAtMeta = const VerificationMeta(
    'deviceCreatedAt',
  );
  @override
  late final GeneratedColumn<String> deviceCreatedAt = GeneratedColumn<String>(
    'device_created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceModifiedAtMeta = const VerificationMeta(
    'deviceModifiedAt',
  );
  @override
  late final GeneratedColumn<String> deviceModifiedAt = GeneratedColumn<String>(
    'device_modified_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<String> receivedAt = GeneratedColumn<String>(
    'received_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedLateMeta = const VerificationMeta(
    'syncedLate',
  );
  @override
  late final GeneratedColumn<bool> syncedLate = GeneratedColumn<bool>(
    'synced_late',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced_late" IN (0, 1))',
    ),
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<String> archivedAt = GeneratedColumn<String>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _recordedByPersonIdMeta =
      const VerificationMeta('recordedByPersonId');
  @override
  late final GeneratedColumn<String> recordedByPersonId =
      GeneratedColumn<String>(
        'recorded_by_person_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    status,
    source,
    recordedByPersonId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'session_attendance';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('round_table_id')) {
      context.handle(
        _roundTableIdMeta,
        roundTableId.isAcceptableOrUnknown(
          data['round_table_id']!,
          _roundTableIdMeta,
        ),
      );
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('device_created_at')) {
      context.handle(
        _deviceCreatedAtMeta,
        deviceCreatedAt.isAcceptableOrUnknown(
          data['device_created_at']!,
          _deviceCreatedAtMeta,
        ),
      );
    }
    if (data.containsKey('device_modified_at')) {
      context.handle(
        _deviceModifiedAtMeta,
        deviceModifiedAt.isAcceptableOrUnknown(
          data['device_modified_at']!,
          _deviceModifiedAtMeta,
        ),
      );
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    }
    if (data.containsKey('synced_late')) {
      context.handle(
        _syncedLateMeta,
        syncedLate.isAcceptableOrUnknown(data['synced_late']!, _syncedLateMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    }
    if (data.containsKey('recorded_by_person_id')) {
      context.handle(
        _recordedByPersonIdMeta,
        recordedByPersonId.isAcceptableOrUnknown(
          data['recorded_by_person_id']!,
          _recordedByPersonIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttendanceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      roundTableId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_table_id'],
      ),
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      ),
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      deviceCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_created_at'],
      ),
      deviceModifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_modified_at'],
      ),
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}received_at'],
      ),
      syncedLate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced_late'],
      ),
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archived_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      ),
      recordedByPersonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorded_by_person_id'],
      ),
    );
  }

  @override
  $SessionAttendanceTable createAlias(String alias) {
    return $SessionAttendanceTable(attachedDatabase, alias);
  }
}

class AttendanceRow extends DataClass implements Insertable<AttendanceRow> {
  final String id;
  final String? organizationId;
  final String? roundTableId;
  final String? sessionId;
  final String? personId;
  final String? deviceCreatedAt;
  final String? deviceModifiedAt;
  final String? receivedAt;
  final bool? syncedLate;
  final String? archivedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? status;
  final String? source;
  final String? recordedByPersonId;
  const AttendanceRow({
    required this.id,
    this.organizationId,
    this.roundTableId,
    this.sessionId,
    this.personId,
    this.deviceCreatedAt,
    this.deviceModifiedAt,
    this.receivedAt,
    this.syncedLate,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.source,
    this.recordedByPersonId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || roundTableId != null) {
      map['round_table_id'] = Variable<String>(roundTableId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || deviceCreatedAt != null) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt);
    }
    if (!nullToAbsent || deviceModifiedAt != null) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt);
    }
    if (!nullToAbsent || receivedAt != null) {
      map['received_at'] = Variable<String>(receivedAt);
    }
    if (!nullToAbsent || syncedLate != null) {
      map['synced_late'] = Variable<bool>(syncedLate);
    }
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<String>(archivedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || recordedByPersonId != null) {
      map['recorded_by_person_id'] = Variable<String>(recordedByPersonId);
    }
    return map;
  }

  SessionAttendanceCompanion toCompanion(bool nullToAbsent) {
    return SessionAttendanceCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      roundTableId: roundTableId == null && nullToAbsent
          ? const Value.absent()
          : Value(roundTableId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      deviceCreatedAt: deviceCreatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceCreatedAt),
      deviceModifiedAt: deviceModifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceModifiedAt),
      receivedAt: receivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedAt),
      syncedLate: syncedLate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedLate),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      status: status == null && nullToAbsent
          ? const Value.absent()
          : Value(status),
      source: source == null && nullToAbsent
          ? const Value.absent()
          : Value(source),
      recordedByPersonId: recordedByPersonId == null && nullToAbsent
          ? const Value.absent()
          : Value(recordedByPersonId),
    );
  }

  factory AttendanceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      roundTableId: serializer.fromJson<String?>(json['roundTableId']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      personId: serializer.fromJson<String?>(json['personId']),
      deviceCreatedAt: serializer.fromJson<String?>(json['deviceCreatedAt']),
      deviceModifiedAt: serializer.fromJson<String?>(json['deviceModifiedAt']),
      receivedAt: serializer.fromJson<String?>(json['receivedAt']),
      syncedLate: serializer.fromJson<bool?>(json['syncedLate']),
      archivedAt: serializer.fromJson<String?>(json['archivedAt']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      status: serializer.fromJson<String?>(json['status']),
      source: serializer.fromJson<String?>(json['source']),
      recordedByPersonId: serializer.fromJson<String?>(
        json['recordedByPersonId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'roundTableId': serializer.toJson<String?>(roundTableId),
      'sessionId': serializer.toJson<String?>(sessionId),
      'personId': serializer.toJson<String?>(personId),
      'deviceCreatedAt': serializer.toJson<String?>(deviceCreatedAt),
      'deviceModifiedAt': serializer.toJson<String?>(deviceModifiedAt),
      'receivedAt': serializer.toJson<String?>(receivedAt),
      'syncedLate': serializer.toJson<bool?>(syncedLate),
      'archivedAt': serializer.toJson<String?>(archivedAt),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'status': serializer.toJson<String?>(status),
      'source': serializer.toJson<String?>(source),
      'recordedByPersonId': serializer.toJson<String?>(recordedByPersonId),
    };
  }

  AttendanceRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> roundTableId = const Value.absent(),
    Value<String?> sessionId = const Value.absent(),
    Value<String?> personId = const Value.absent(),
    Value<String?> deviceCreatedAt = const Value.absent(),
    Value<String?> deviceModifiedAt = const Value.absent(),
    Value<String?> receivedAt = const Value.absent(),
    Value<bool?> syncedLate = const Value.absent(),
    Value<String?> archivedAt = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> status = const Value.absent(),
    Value<String?> source = const Value.absent(),
    Value<String?> recordedByPersonId = const Value.absent(),
  }) => AttendanceRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    roundTableId: roundTableId.present ? roundTableId.value : this.roundTableId,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
    personId: personId.present ? personId.value : this.personId,
    deviceCreatedAt: deviceCreatedAt.present
        ? deviceCreatedAt.value
        : this.deviceCreatedAt,
    deviceModifiedAt: deviceModifiedAt.present
        ? deviceModifiedAt.value
        : this.deviceModifiedAt,
    receivedAt: receivedAt.present ? receivedAt.value : this.receivedAt,
    syncedLate: syncedLate.present ? syncedLate.value : this.syncedLate,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    status: status.present ? status.value : this.status,
    source: source.present ? source.value : this.source,
    recordedByPersonId: recordedByPersonId.present
        ? recordedByPersonId.value
        : this.recordedByPersonId,
  );
  AttendanceRow copyWithCompanion(SessionAttendanceCompanion data) {
    return AttendanceRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      roundTableId: data.roundTableId.present
          ? data.roundTableId.value
          : this.roundTableId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      personId: data.personId.present ? data.personId.value : this.personId,
      deviceCreatedAt: data.deviceCreatedAt.present
          ? data.deviceCreatedAt.value
          : this.deviceCreatedAt,
      deviceModifiedAt: data.deviceModifiedAt.present
          ? data.deviceModifiedAt.value
          : this.deviceModifiedAt,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      syncedLate: data.syncedLate.present
          ? data.syncedLate.value
          : this.syncedLate,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      status: data.status.present ? data.status.value : this.status,
      source: data.source.present ? data.source.value : this.source,
      recordedByPersonId: data.recordedByPersonId.present
          ? data.recordedByPersonId.value
          : this.recordedByPersonId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('status: $status, ')
          ..write('source: $source, ')
          ..write('recordedByPersonId: $recordedByPersonId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    status,
    source,
    recordedByPersonId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.roundTableId == this.roundTableId &&
          other.sessionId == this.sessionId &&
          other.personId == this.personId &&
          other.deviceCreatedAt == this.deviceCreatedAt &&
          other.deviceModifiedAt == this.deviceModifiedAt &&
          other.receivedAt == this.receivedAt &&
          other.syncedLate == this.syncedLate &&
          other.archivedAt == this.archivedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.status == this.status &&
          other.source == this.source &&
          other.recordedByPersonId == this.recordedByPersonId);
}

class SessionAttendanceCompanion extends UpdateCompanion<AttendanceRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> roundTableId;
  final Value<String?> sessionId;
  final Value<String?> personId;
  final Value<String?> deviceCreatedAt;
  final Value<String?> deviceModifiedAt;
  final Value<String?> receivedAt;
  final Value<bool?> syncedLate;
  final Value<String?> archivedAt;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<String?> status;
  final Value<String?> source;
  final Value<String?> recordedByPersonId;
  final Value<int> rowid;
  const SessionAttendanceCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.source = const Value.absent(),
    this.recordedByPersonId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SessionAttendanceCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.source = const Value.absent(),
    this.recordedByPersonId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<AttendanceRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? roundTableId,
    Expression<String>? sessionId,
    Expression<String>? personId,
    Expression<String>? deviceCreatedAt,
    Expression<String>? deviceModifiedAt,
    Expression<String>? receivedAt,
    Expression<bool>? syncedLate,
    Expression<String>? archivedAt,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? status,
    Expression<String>? source,
    Expression<String>? recordedByPersonId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (roundTableId != null) 'round_table_id': roundTableId,
      if (sessionId != null) 'session_id': sessionId,
      if (personId != null) 'person_id': personId,
      if (deviceCreatedAt != null) 'device_created_at': deviceCreatedAt,
      if (deviceModifiedAt != null) 'device_modified_at': deviceModifiedAt,
      if (receivedAt != null) 'received_at': receivedAt,
      if (syncedLate != null) 'synced_late': syncedLate,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (status != null) 'status': status,
      if (source != null) 'source': source,
      if (recordedByPersonId != null)
        'recorded_by_person_id': recordedByPersonId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SessionAttendanceCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? roundTableId,
    Value<String?>? sessionId,
    Value<String?>? personId,
    Value<String?>? deviceCreatedAt,
    Value<String?>? deviceModifiedAt,
    Value<String?>? receivedAt,
    Value<bool?>? syncedLate,
    Value<String?>? archivedAt,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<String?>? status,
    Value<String?>? source,
    Value<String?>? recordedByPersonId,
    Value<int>? rowid,
  }) {
    return SessionAttendanceCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      roundTableId: roundTableId ?? this.roundTableId,
      sessionId: sessionId ?? this.sessionId,
      personId: personId ?? this.personId,
      deviceCreatedAt: deviceCreatedAt ?? this.deviceCreatedAt,
      deviceModifiedAt: deviceModifiedAt ?? this.deviceModifiedAt,
      receivedAt: receivedAt ?? this.receivedAt,
      syncedLate: syncedLate ?? this.syncedLate,
      archivedAt: archivedAt ?? this.archivedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      source: source ?? this.source,
      recordedByPersonId: recordedByPersonId ?? this.recordedByPersonId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (roundTableId.present) {
      map['round_table_id'] = Variable<String>(roundTableId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (deviceCreatedAt.present) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt.value);
    }
    if (deviceModifiedAt.present) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<String>(receivedAt.value);
    }
    if (syncedLate.present) {
      map['synced_late'] = Variable<bool>(syncedLate.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<String>(archivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (recordedByPersonId.present) {
      map['recorded_by_person_id'] = Variable<String>(recordedByPersonId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SessionAttendanceCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('status: $status, ')
          ..write('source: $source, ')
          ..write('recordedByPersonId: $recordedByPersonId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemberAssessmentsTable extends MemberAssessments
    with TableInfo<$MemberAssessmentsTable, AssessmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberAssessmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roundTableIdMeta = const VerificationMeta(
    'roundTableId',
  );
  @override
  late final GeneratedColumn<String> roundTableId = GeneratedColumn<String>(
    'round_table_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceCreatedAtMeta = const VerificationMeta(
    'deviceCreatedAt',
  );
  @override
  late final GeneratedColumn<String> deviceCreatedAt = GeneratedColumn<String>(
    'device_created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceModifiedAtMeta = const VerificationMeta(
    'deviceModifiedAt',
  );
  @override
  late final GeneratedColumn<String> deviceModifiedAt = GeneratedColumn<String>(
    'device_modified_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<String> receivedAt = GeneratedColumn<String>(
    'received_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedLateMeta = const VerificationMeta(
    'syncedLate',
  );
  @override
  late final GeneratedColumn<bool> syncedLate = GeneratedColumn<bool>(
    'synced_late',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced_late" IN (0, 1))',
    ),
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<String> archivedAt = GeneratedColumn<String>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueIdMeta = const VerificationMeta(
    'valueId',
  );
  @override
  late final GeneratedColumn<String> valueId = GeneratedColumn<String>(
    'value_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _justificationMeta = const VerificationMeta(
    'justification',
  );
  @override
  late final GeneratedColumn<String> justification = GeneratedColumn<String>(
    'justification',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    valueId,
    kind,
    score,
    justification,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'member_assessments';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssessmentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('round_table_id')) {
      context.handle(
        _roundTableIdMeta,
        roundTableId.isAcceptableOrUnknown(
          data['round_table_id']!,
          _roundTableIdMeta,
        ),
      );
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('device_created_at')) {
      context.handle(
        _deviceCreatedAtMeta,
        deviceCreatedAt.isAcceptableOrUnknown(
          data['device_created_at']!,
          _deviceCreatedAtMeta,
        ),
      );
    }
    if (data.containsKey('device_modified_at')) {
      context.handle(
        _deviceModifiedAtMeta,
        deviceModifiedAt.isAcceptableOrUnknown(
          data['device_modified_at']!,
          _deviceModifiedAtMeta,
        ),
      );
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    }
    if (data.containsKey('synced_late')) {
      context.handle(
        _syncedLateMeta,
        syncedLate.isAcceptableOrUnknown(data['synced_late']!, _syncedLateMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('value_id')) {
      context.handle(
        _valueIdMeta,
        valueId.isAcceptableOrUnknown(data['value_id']!, _valueIdMeta),
      );
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    }
    if (data.containsKey('justification')) {
      context.handle(
        _justificationMeta,
        justification.isAcceptableOrUnknown(
          data['justification']!,
          _justificationMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssessmentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssessmentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      roundTableId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_table_id'],
      ),
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      ),
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      deviceCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_created_at'],
      ),
      deviceModifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_modified_at'],
      ),
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}received_at'],
      ),
      syncedLate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced_late'],
      ),
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archived_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
      valueId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_id'],
      ),
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      ),
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      ),
      justification: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}justification'],
      ),
    );
  }

  @override
  $MemberAssessmentsTable createAlias(String alias) {
    return $MemberAssessmentsTable(attachedDatabase, alias);
  }
}

class AssessmentRow extends DataClass implements Insertable<AssessmentRow> {
  final String id;
  final String? organizationId;
  final String? roundTableId;
  final String? sessionId;
  final String? personId;
  final String? deviceCreatedAt;
  final String? deviceModifiedAt;
  final String? receivedAt;
  final bool? syncedLate;
  final String? archivedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? valueId;
  final String? kind;
  final int? score;
  final String? justification;
  const AssessmentRow({
    required this.id,
    this.organizationId,
    this.roundTableId,
    this.sessionId,
    this.personId,
    this.deviceCreatedAt,
    this.deviceModifiedAt,
    this.receivedAt,
    this.syncedLate,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
    this.valueId,
    this.kind,
    this.score,
    this.justification,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || roundTableId != null) {
      map['round_table_id'] = Variable<String>(roundTableId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || deviceCreatedAt != null) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt);
    }
    if (!nullToAbsent || deviceModifiedAt != null) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt);
    }
    if (!nullToAbsent || receivedAt != null) {
      map['received_at'] = Variable<String>(receivedAt);
    }
    if (!nullToAbsent || syncedLate != null) {
      map['synced_late'] = Variable<bool>(syncedLate);
    }
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<String>(archivedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || valueId != null) {
      map['value_id'] = Variable<String>(valueId);
    }
    if (!nullToAbsent || kind != null) {
      map['kind'] = Variable<String>(kind);
    }
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    if (!nullToAbsent || justification != null) {
      map['justification'] = Variable<String>(justification);
    }
    return map;
  }

  MemberAssessmentsCompanion toCompanion(bool nullToAbsent) {
    return MemberAssessmentsCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      roundTableId: roundTableId == null && nullToAbsent
          ? const Value.absent()
          : Value(roundTableId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      deviceCreatedAt: deviceCreatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceCreatedAt),
      deviceModifiedAt: deviceModifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceModifiedAt),
      receivedAt: receivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedAt),
      syncedLate: syncedLate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedLate),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      valueId: valueId == null && nullToAbsent
          ? const Value.absent()
          : Value(valueId),
      kind: kind == null && nullToAbsent ? const Value.absent() : Value(kind),
      score: score == null && nullToAbsent
          ? const Value.absent()
          : Value(score),
      justification: justification == null && nullToAbsent
          ? const Value.absent()
          : Value(justification),
    );
  }

  factory AssessmentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssessmentRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      roundTableId: serializer.fromJson<String?>(json['roundTableId']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      personId: serializer.fromJson<String?>(json['personId']),
      deviceCreatedAt: serializer.fromJson<String?>(json['deviceCreatedAt']),
      deviceModifiedAt: serializer.fromJson<String?>(json['deviceModifiedAt']),
      receivedAt: serializer.fromJson<String?>(json['receivedAt']),
      syncedLate: serializer.fromJson<bool?>(json['syncedLate']),
      archivedAt: serializer.fromJson<String?>(json['archivedAt']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      valueId: serializer.fromJson<String?>(json['valueId']),
      kind: serializer.fromJson<String?>(json['kind']),
      score: serializer.fromJson<int?>(json['score']),
      justification: serializer.fromJson<String?>(json['justification']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'roundTableId': serializer.toJson<String?>(roundTableId),
      'sessionId': serializer.toJson<String?>(sessionId),
      'personId': serializer.toJson<String?>(personId),
      'deviceCreatedAt': serializer.toJson<String?>(deviceCreatedAt),
      'deviceModifiedAt': serializer.toJson<String?>(deviceModifiedAt),
      'receivedAt': serializer.toJson<String?>(receivedAt),
      'syncedLate': serializer.toJson<bool?>(syncedLate),
      'archivedAt': serializer.toJson<String?>(archivedAt),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'valueId': serializer.toJson<String?>(valueId),
      'kind': serializer.toJson<String?>(kind),
      'score': serializer.toJson<int?>(score),
      'justification': serializer.toJson<String?>(justification),
    };
  }

  AssessmentRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> roundTableId = const Value.absent(),
    Value<String?> sessionId = const Value.absent(),
    Value<String?> personId = const Value.absent(),
    Value<String?> deviceCreatedAt = const Value.absent(),
    Value<String?> deviceModifiedAt = const Value.absent(),
    Value<String?> receivedAt = const Value.absent(),
    Value<bool?> syncedLate = const Value.absent(),
    Value<String?> archivedAt = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> valueId = const Value.absent(),
    Value<String?> kind = const Value.absent(),
    Value<int?> score = const Value.absent(),
    Value<String?> justification = const Value.absent(),
  }) => AssessmentRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    roundTableId: roundTableId.present ? roundTableId.value : this.roundTableId,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
    personId: personId.present ? personId.value : this.personId,
    deviceCreatedAt: deviceCreatedAt.present
        ? deviceCreatedAt.value
        : this.deviceCreatedAt,
    deviceModifiedAt: deviceModifiedAt.present
        ? deviceModifiedAt.value
        : this.deviceModifiedAt,
    receivedAt: receivedAt.present ? receivedAt.value : this.receivedAt,
    syncedLate: syncedLate.present ? syncedLate.value : this.syncedLate,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    valueId: valueId.present ? valueId.value : this.valueId,
    kind: kind.present ? kind.value : this.kind,
    score: score.present ? score.value : this.score,
    justification: justification.present
        ? justification.value
        : this.justification,
  );
  AssessmentRow copyWithCompanion(MemberAssessmentsCompanion data) {
    return AssessmentRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      roundTableId: data.roundTableId.present
          ? data.roundTableId.value
          : this.roundTableId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      personId: data.personId.present ? data.personId.value : this.personId,
      deviceCreatedAt: data.deviceCreatedAt.present
          ? data.deviceCreatedAt.value
          : this.deviceCreatedAt,
      deviceModifiedAt: data.deviceModifiedAt.present
          ? data.deviceModifiedAt.value
          : this.deviceModifiedAt,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      syncedLate: data.syncedLate.present
          ? data.syncedLate.value
          : this.syncedLate,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      valueId: data.valueId.present ? data.valueId.value : this.valueId,
      kind: data.kind.present ? data.kind.value : this.kind,
      score: data.score.present ? data.score.value : this.score,
      justification: data.justification.present
          ? data.justification.value
          : this.justification,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssessmentRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('valueId: $valueId, ')
          ..write('kind: $kind, ')
          ..write('score: $score, ')
          ..write('justification: $justification')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    valueId,
    kind,
    score,
    justification,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssessmentRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.roundTableId == this.roundTableId &&
          other.sessionId == this.sessionId &&
          other.personId == this.personId &&
          other.deviceCreatedAt == this.deviceCreatedAt &&
          other.deviceModifiedAt == this.deviceModifiedAt &&
          other.receivedAt == this.receivedAt &&
          other.syncedLate == this.syncedLate &&
          other.archivedAt == this.archivedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.valueId == this.valueId &&
          other.kind == this.kind &&
          other.score == this.score &&
          other.justification == this.justification);
}

class MemberAssessmentsCompanion extends UpdateCompanion<AssessmentRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> roundTableId;
  final Value<String?> sessionId;
  final Value<String?> personId;
  final Value<String?> deviceCreatedAt;
  final Value<String?> deviceModifiedAt;
  final Value<String?> receivedAt;
  final Value<bool?> syncedLate;
  final Value<String?> archivedAt;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<String?> valueId;
  final Value<String?> kind;
  final Value<int?> score;
  final Value<String?> justification;
  final Value<int> rowid;
  const MemberAssessmentsCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.valueId = const Value.absent(),
    this.kind = const Value.absent(),
    this.score = const Value.absent(),
    this.justification = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemberAssessmentsCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.valueId = const Value.absent(),
    this.kind = const Value.absent(),
    this.score = const Value.absent(),
    this.justification = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<AssessmentRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? roundTableId,
    Expression<String>? sessionId,
    Expression<String>? personId,
    Expression<String>? deviceCreatedAt,
    Expression<String>? deviceModifiedAt,
    Expression<String>? receivedAt,
    Expression<bool>? syncedLate,
    Expression<String>? archivedAt,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? valueId,
    Expression<String>? kind,
    Expression<int>? score,
    Expression<String>? justification,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (roundTableId != null) 'round_table_id': roundTableId,
      if (sessionId != null) 'session_id': sessionId,
      if (personId != null) 'person_id': personId,
      if (deviceCreatedAt != null) 'device_created_at': deviceCreatedAt,
      if (deviceModifiedAt != null) 'device_modified_at': deviceModifiedAt,
      if (receivedAt != null) 'received_at': receivedAt,
      if (syncedLate != null) 'synced_late': syncedLate,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (valueId != null) 'value_id': valueId,
      if (kind != null) 'kind': kind,
      if (score != null) 'score': score,
      if (justification != null) 'justification': justification,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemberAssessmentsCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? roundTableId,
    Value<String?>? sessionId,
    Value<String?>? personId,
    Value<String?>? deviceCreatedAt,
    Value<String?>? deviceModifiedAt,
    Value<String?>? receivedAt,
    Value<bool?>? syncedLate,
    Value<String?>? archivedAt,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<String?>? valueId,
    Value<String?>? kind,
    Value<int?>? score,
    Value<String?>? justification,
    Value<int>? rowid,
  }) {
    return MemberAssessmentsCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      roundTableId: roundTableId ?? this.roundTableId,
      sessionId: sessionId ?? this.sessionId,
      personId: personId ?? this.personId,
      deviceCreatedAt: deviceCreatedAt ?? this.deviceCreatedAt,
      deviceModifiedAt: deviceModifiedAt ?? this.deviceModifiedAt,
      receivedAt: receivedAt ?? this.receivedAt,
      syncedLate: syncedLate ?? this.syncedLate,
      archivedAt: archivedAt ?? this.archivedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      valueId: valueId ?? this.valueId,
      kind: kind ?? this.kind,
      score: score ?? this.score,
      justification: justification ?? this.justification,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (roundTableId.present) {
      map['round_table_id'] = Variable<String>(roundTableId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (deviceCreatedAt.present) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt.value);
    }
    if (deviceModifiedAt.present) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<String>(receivedAt.value);
    }
    if (syncedLate.present) {
      map['synced_late'] = Variable<bool>(syncedLate.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<String>(archivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (valueId.present) {
      map['value_id'] = Variable<String>(valueId.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (justification.present) {
      map['justification'] = Variable<String>(justification.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberAssessmentsCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('valueId: $valueId, ')
          ..write('kind: $kind, ')
          ..write('score: $score, ')
          ..write('justification: $justification, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemberAnswersTable extends MemberAnswers
    with TableInfo<$MemberAnswersTable, AnswerRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roundTableIdMeta = const VerificationMeta(
    'roundTableId',
  );
  @override
  late final GeneratedColumn<String> roundTableId = GeneratedColumn<String>(
    'round_table_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceCreatedAtMeta = const VerificationMeta(
    'deviceCreatedAt',
  );
  @override
  late final GeneratedColumn<String> deviceCreatedAt = GeneratedColumn<String>(
    'device_created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceModifiedAtMeta = const VerificationMeta(
    'deviceModifiedAt',
  );
  @override
  late final GeneratedColumn<String> deviceModifiedAt = GeneratedColumn<String>(
    'device_modified_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<String> receivedAt = GeneratedColumn<String>(
    'received_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedLateMeta = const VerificationMeta(
    'syncedLate',
  );
  @override
  late final GeneratedColumn<bool> syncedLate = GeneratedColumn<bool>(
    'synced_late',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced_late" IN (0, 1))',
    ),
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<String> archivedAt = GeneratedColumn<String>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueIdMeta = const VerificationMeta(
    'valueId',
  );
  @override
  late final GeneratedColumn<String> valueId = GeneratedColumn<String>(
    'value_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _answerTextMeta = const VerificationMeta(
    'answerText',
  );
  @override
  late final GeneratedColumn<String> answerText = GeneratedColumn<String>(
    'answer_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    valueId,
    questionId,
    answerText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'member_answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<AnswerRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('round_table_id')) {
      context.handle(
        _roundTableIdMeta,
        roundTableId.isAcceptableOrUnknown(
          data['round_table_id']!,
          _roundTableIdMeta,
        ),
      );
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('device_created_at')) {
      context.handle(
        _deviceCreatedAtMeta,
        deviceCreatedAt.isAcceptableOrUnknown(
          data['device_created_at']!,
          _deviceCreatedAtMeta,
        ),
      );
    }
    if (data.containsKey('device_modified_at')) {
      context.handle(
        _deviceModifiedAtMeta,
        deviceModifiedAt.isAcceptableOrUnknown(
          data['device_modified_at']!,
          _deviceModifiedAtMeta,
        ),
      );
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    }
    if (data.containsKey('synced_late')) {
      context.handle(
        _syncedLateMeta,
        syncedLate.isAcceptableOrUnknown(data['synced_late']!, _syncedLateMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('value_id')) {
      context.handle(
        _valueIdMeta,
        valueId.isAcceptableOrUnknown(data['value_id']!, _valueIdMeta),
      );
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    }
    if (data.containsKey('answer_text')) {
      context.handle(
        _answerTextMeta,
        answerText.isAcceptableOrUnknown(data['answer_text']!, _answerTextMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnswerRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnswerRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      roundTableId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_table_id'],
      ),
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      ),
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      deviceCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_created_at'],
      ),
      deviceModifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_modified_at'],
      ),
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}received_at'],
      ),
      syncedLate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced_late'],
      ),
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archived_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
      valueId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_id'],
      ),
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      ),
      answerText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer_text'],
      ),
    );
  }

  @override
  $MemberAnswersTable createAlias(String alias) {
    return $MemberAnswersTable(attachedDatabase, alias);
  }
}

class AnswerRow extends DataClass implements Insertable<AnswerRow> {
  final String id;
  final String? organizationId;
  final String? roundTableId;
  final String? sessionId;
  final String? personId;
  final String? deviceCreatedAt;
  final String? deviceModifiedAt;
  final String? receivedAt;
  final bool? syncedLate;
  final String? archivedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? valueId;
  final String? questionId;
  final String? answerText;
  const AnswerRow({
    required this.id,
    this.organizationId,
    this.roundTableId,
    this.sessionId,
    this.personId,
    this.deviceCreatedAt,
    this.deviceModifiedAt,
    this.receivedAt,
    this.syncedLate,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
    this.valueId,
    this.questionId,
    this.answerText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || roundTableId != null) {
      map['round_table_id'] = Variable<String>(roundTableId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || deviceCreatedAt != null) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt);
    }
    if (!nullToAbsent || deviceModifiedAt != null) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt);
    }
    if (!nullToAbsent || receivedAt != null) {
      map['received_at'] = Variable<String>(receivedAt);
    }
    if (!nullToAbsent || syncedLate != null) {
      map['synced_late'] = Variable<bool>(syncedLate);
    }
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<String>(archivedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || valueId != null) {
      map['value_id'] = Variable<String>(valueId);
    }
    if (!nullToAbsent || questionId != null) {
      map['question_id'] = Variable<String>(questionId);
    }
    if (!nullToAbsent || answerText != null) {
      map['answer_text'] = Variable<String>(answerText);
    }
    return map;
  }

  MemberAnswersCompanion toCompanion(bool nullToAbsent) {
    return MemberAnswersCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      roundTableId: roundTableId == null && nullToAbsent
          ? const Value.absent()
          : Value(roundTableId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      deviceCreatedAt: deviceCreatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceCreatedAt),
      deviceModifiedAt: deviceModifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceModifiedAt),
      receivedAt: receivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedAt),
      syncedLate: syncedLate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedLate),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      valueId: valueId == null && nullToAbsent
          ? const Value.absent()
          : Value(valueId),
      questionId: questionId == null && nullToAbsent
          ? const Value.absent()
          : Value(questionId),
      answerText: answerText == null && nullToAbsent
          ? const Value.absent()
          : Value(answerText),
    );
  }

  factory AnswerRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnswerRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      roundTableId: serializer.fromJson<String?>(json['roundTableId']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      personId: serializer.fromJson<String?>(json['personId']),
      deviceCreatedAt: serializer.fromJson<String?>(json['deviceCreatedAt']),
      deviceModifiedAt: serializer.fromJson<String?>(json['deviceModifiedAt']),
      receivedAt: serializer.fromJson<String?>(json['receivedAt']),
      syncedLate: serializer.fromJson<bool?>(json['syncedLate']),
      archivedAt: serializer.fromJson<String?>(json['archivedAt']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      valueId: serializer.fromJson<String?>(json['valueId']),
      questionId: serializer.fromJson<String?>(json['questionId']),
      answerText: serializer.fromJson<String?>(json['answerText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'roundTableId': serializer.toJson<String?>(roundTableId),
      'sessionId': serializer.toJson<String?>(sessionId),
      'personId': serializer.toJson<String?>(personId),
      'deviceCreatedAt': serializer.toJson<String?>(deviceCreatedAt),
      'deviceModifiedAt': serializer.toJson<String?>(deviceModifiedAt),
      'receivedAt': serializer.toJson<String?>(receivedAt),
      'syncedLate': serializer.toJson<bool?>(syncedLate),
      'archivedAt': serializer.toJson<String?>(archivedAt),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'valueId': serializer.toJson<String?>(valueId),
      'questionId': serializer.toJson<String?>(questionId),
      'answerText': serializer.toJson<String?>(answerText),
    };
  }

  AnswerRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> roundTableId = const Value.absent(),
    Value<String?> sessionId = const Value.absent(),
    Value<String?> personId = const Value.absent(),
    Value<String?> deviceCreatedAt = const Value.absent(),
    Value<String?> deviceModifiedAt = const Value.absent(),
    Value<String?> receivedAt = const Value.absent(),
    Value<bool?> syncedLate = const Value.absent(),
    Value<String?> archivedAt = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> valueId = const Value.absent(),
    Value<String?> questionId = const Value.absent(),
    Value<String?> answerText = const Value.absent(),
  }) => AnswerRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    roundTableId: roundTableId.present ? roundTableId.value : this.roundTableId,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
    personId: personId.present ? personId.value : this.personId,
    deviceCreatedAt: deviceCreatedAt.present
        ? deviceCreatedAt.value
        : this.deviceCreatedAt,
    deviceModifiedAt: deviceModifiedAt.present
        ? deviceModifiedAt.value
        : this.deviceModifiedAt,
    receivedAt: receivedAt.present ? receivedAt.value : this.receivedAt,
    syncedLate: syncedLate.present ? syncedLate.value : this.syncedLate,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    valueId: valueId.present ? valueId.value : this.valueId,
    questionId: questionId.present ? questionId.value : this.questionId,
    answerText: answerText.present ? answerText.value : this.answerText,
  );
  AnswerRow copyWithCompanion(MemberAnswersCompanion data) {
    return AnswerRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      roundTableId: data.roundTableId.present
          ? data.roundTableId.value
          : this.roundTableId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      personId: data.personId.present ? data.personId.value : this.personId,
      deviceCreatedAt: data.deviceCreatedAt.present
          ? data.deviceCreatedAt.value
          : this.deviceCreatedAt,
      deviceModifiedAt: data.deviceModifiedAt.present
          ? data.deviceModifiedAt.value
          : this.deviceModifiedAt,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      syncedLate: data.syncedLate.present
          ? data.syncedLate.value
          : this.syncedLate,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      valueId: data.valueId.present ? data.valueId.value : this.valueId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      answerText: data.answerText.present
          ? data.answerText.value
          : this.answerText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnswerRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('valueId: $valueId, ')
          ..write('questionId: $questionId, ')
          ..write('answerText: $answerText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    valueId,
    questionId,
    answerText,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnswerRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.roundTableId == this.roundTableId &&
          other.sessionId == this.sessionId &&
          other.personId == this.personId &&
          other.deviceCreatedAt == this.deviceCreatedAt &&
          other.deviceModifiedAt == this.deviceModifiedAt &&
          other.receivedAt == this.receivedAt &&
          other.syncedLate == this.syncedLate &&
          other.archivedAt == this.archivedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.valueId == this.valueId &&
          other.questionId == this.questionId &&
          other.answerText == this.answerText);
}

class MemberAnswersCompanion extends UpdateCompanion<AnswerRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> roundTableId;
  final Value<String?> sessionId;
  final Value<String?> personId;
  final Value<String?> deviceCreatedAt;
  final Value<String?> deviceModifiedAt;
  final Value<String?> receivedAt;
  final Value<bool?> syncedLate;
  final Value<String?> archivedAt;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<String?> valueId;
  final Value<String?> questionId;
  final Value<String?> answerText;
  final Value<int> rowid;
  const MemberAnswersCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.valueId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.answerText = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemberAnswersCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.valueId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.answerText = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<AnswerRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? roundTableId,
    Expression<String>? sessionId,
    Expression<String>? personId,
    Expression<String>? deviceCreatedAt,
    Expression<String>? deviceModifiedAt,
    Expression<String>? receivedAt,
    Expression<bool>? syncedLate,
    Expression<String>? archivedAt,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? valueId,
    Expression<String>? questionId,
    Expression<String>? answerText,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (roundTableId != null) 'round_table_id': roundTableId,
      if (sessionId != null) 'session_id': sessionId,
      if (personId != null) 'person_id': personId,
      if (deviceCreatedAt != null) 'device_created_at': deviceCreatedAt,
      if (deviceModifiedAt != null) 'device_modified_at': deviceModifiedAt,
      if (receivedAt != null) 'received_at': receivedAt,
      if (syncedLate != null) 'synced_late': syncedLate,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (valueId != null) 'value_id': valueId,
      if (questionId != null) 'question_id': questionId,
      if (answerText != null) 'answer_text': answerText,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemberAnswersCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? roundTableId,
    Value<String?>? sessionId,
    Value<String?>? personId,
    Value<String?>? deviceCreatedAt,
    Value<String?>? deviceModifiedAt,
    Value<String?>? receivedAt,
    Value<bool?>? syncedLate,
    Value<String?>? archivedAt,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<String?>? valueId,
    Value<String?>? questionId,
    Value<String?>? answerText,
    Value<int>? rowid,
  }) {
    return MemberAnswersCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      roundTableId: roundTableId ?? this.roundTableId,
      sessionId: sessionId ?? this.sessionId,
      personId: personId ?? this.personId,
      deviceCreatedAt: deviceCreatedAt ?? this.deviceCreatedAt,
      deviceModifiedAt: deviceModifiedAt ?? this.deviceModifiedAt,
      receivedAt: receivedAt ?? this.receivedAt,
      syncedLate: syncedLate ?? this.syncedLate,
      archivedAt: archivedAt ?? this.archivedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      valueId: valueId ?? this.valueId,
      questionId: questionId ?? this.questionId,
      answerText: answerText ?? this.answerText,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (roundTableId.present) {
      map['round_table_id'] = Variable<String>(roundTableId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (deviceCreatedAt.present) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt.value);
    }
    if (deviceModifiedAt.present) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<String>(receivedAt.value);
    }
    if (syncedLate.present) {
      map['synced_late'] = Variable<bool>(syncedLate.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<String>(archivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (valueId.present) {
      map['value_id'] = Variable<String>(valueId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (answerText.present) {
      map['answer_text'] = Variable<String>(answerText.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberAnswersCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('valueId: $valueId, ')
          ..write('questionId: $questionId, ')
          ..write('answerText: $answerText, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MemberCommitmentsTable extends MemberCommitments
    with TableInfo<$MemberCommitmentsTable, CommitmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberCommitmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _organizationIdMeta = const VerificationMeta(
    'organizationId',
  );
  @override
  late final GeneratedColumn<String> organizationId = GeneratedColumn<String>(
    'organization_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _roundTableIdMeta = const VerificationMeta(
    'roundTableId',
  );
  @override
  late final GeneratedColumn<String> roundTableId = GeneratedColumn<String>(
    'round_table_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _personIdMeta = const VerificationMeta(
    'personId',
  );
  @override
  late final GeneratedColumn<String> personId = GeneratedColumn<String>(
    'person_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceCreatedAtMeta = const VerificationMeta(
    'deviceCreatedAt',
  );
  @override
  late final GeneratedColumn<String> deviceCreatedAt = GeneratedColumn<String>(
    'device_created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deviceModifiedAtMeta = const VerificationMeta(
    'deviceModifiedAt',
  );
  @override
  late final GeneratedColumn<String> deviceModifiedAt = GeneratedColumn<String>(
    'device_modified_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _receivedAtMeta = const VerificationMeta(
    'receivedAt',
  );
  @override
  late final GeneratedColumn<String> receivedAt = GeneratedColumn<String>(
    'received_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _syncedLateMeta = const VerificationMeta(
    'syncedLate',
  );
  @override
  late final GeneratedColumn<bool> syncedLate = GeneratedColumn<bool>(
    'synced_late',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("synced_late" IN (0, 1))',
    ),
  );
  static const VerificationMeta _archivedAtMeta = const VerificationMeta(
    'archivedAt',
  );
  @override
  late final GeneratedColumn<String> archivedAt = GeneratedColumn<String>(
    'archived_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
    'updated_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valueIdMeta = const VerificationMeta(
    'valueId',
  );
  @override
  late final GeneratedColumn<String> valueId = GeneratedColumn<String>(
    'value_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _actionTextMeta = const VerificationMeta(
    'actionText',
  );
  @override
  late final GeneratedColumn<String> actionText = GeneratedColumn<String>(
    'action_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _measureTextMeta = const VerificationMeta(
    'measureText',
  );
  @override
  late final GeneratedColumn<String> measureText = GeneratedColumn<String>(
    'measure_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpSessionIdMeta = const VerificationMeta(
    'followUpSessionId',
  );
  @override
  late final GeneratedColumn<String> followUpSessionId =
      GeneratedColumn<String>(
        'follow_up_session_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _followUpStatusMeta = const VerificationMeta(
    'followUpStatus',
  );
  @override
  late final GeneratedColumn<String> followUpStatus = GeneratedColumn<String>(
    'follow_up_status',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpNoteMeta = const VerificationMeta(
    'followUpNote',
  );
  @override
  late final GeneratedColumn<String> followUpNote = GeneratedColumn<String>(
    'follow_up_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpDeviceAtMeta = const VerificationMeta(
    'followUpDeviceAt',
  );
  @override
  late final GeneratedColumn<String> followUpDeviceAt = GeneratedColumn<String>(
    'follow_up_device_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _followUpReceivedAtMeta =
      const VerificationMeta('followUpReceivedAt');
  @override
  late final GeneratedColumn<String> followUpReceivedAt =
      GeneratedColumn<String>(
        'follow_up_received_at',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _followUpSyncedLateMeta =
      const VerificationMeta('followUpSyncedLate');
  @override
  late final GeneratedColumn<bool> followUpSyncedLate = GeneratedColumn<bool>(
    'follow_up_synced_late',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("follow_up_synced_late" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    valueId,
    actionText,
    measureText,
    followUpSessionId,
    followUpStatus,
    followUpNote,
    followUpDeviceAt,
    followUpReceivedAt,
    followUpSyncedLate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'member_commitments';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommitmentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('organization_id')) {
      context.handle(
        _organizationIdMeta,
        organizationId.isAcceptableOrUnknown(
          data['organization_id']!,
          _organizationIdMeta,
        ),
      );
    }
    if (data.containsKey('round_table_id')) {
      context.handle(
        _roundTableIdMeta,
        roundTableId.isAcceptableOrUnknown(
          data['round_table_id']!,
          _roundTableIdMeta,
        ),
      );
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    }
    if (data.containsKey('person_id')) {
      context.handle(
        _personIdMeta,
        personId.isAcceptableOrUnknown(data['person_id']!, _personIdMeta),
      );
    }
    if (data.containsKey('device_created_at')) {
      context.handle(
        _deviceCreatedAtMeta,
        deviceCreatedAt.isAcceptableOrUnknown(
          data['device_created_at']!,
          _deviceCreatedAtMeta,
        ),
      );
    }
    if (data.containsKey('device_modified_at')) {
      context.handle(
        _deviceModifiedAtMeta,
        deviceModifiedAt.isAcceptableOrUnknown(
          data['device_modified_at']!,
          _deviceModifiedAtMeta,
        ),
      );
    }
    if (data.containsKey('received_at')) {
      context.handle(
        _receivedAtMeta,
        receivedAt.isAcceptableOrUnknown(data['received_at']!, _receivedAtMeta),
      );
    }
    if (data.containsKey('synced_late')) {
      context.handle(
        _syncedLateMeta,
        syncedLate.isAcceptableOrUnknown(data['synced_late']!, _syncedLateMeta),
      );
    }
    if (data.containsKey('archived_at')) {
      context.handle(
        _archivedAtMeta,
        archivedAt.isAcceptableOrUnknown(data['archived_at']!, _archivedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('value_id')) {
      context.handle(
        _valueIdMeta,
        valueId.isAcceptableOrUnknown(data['value_id']!, _valueIdMeta),
      );
    }
    if (data.containsKey('action_text')) {
      context.handle(
        _actionTextMeta,
        actionText.isAcceptableOrUnknown(data['action_text']!, _actionTextMeta),
      );
    }
    if (data.containsKey('measure_text')) {
      context.handle(
        _measureTextMeta,
        measureText.isAcceptableOrUnknown(
          data['measure_text']!,
          _measureTextMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_session_id')) {
      context.handle(
        _followUpSessionIdMeta,
        followUpSessionId.isAcceptableOrUnknown(
          data['follow_up_session_id']!,
          _followUpSessionIdMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_status')) {
      context.handle(
        _followUpStatusMeta,
        followUpStatus.isAcceptableOrUnknown(
          data['follow_up_status']!,
          _followUpStatusMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_note')) {
      context.handle(
        _followUpNoteMeta,
        followUpNote.isAcceptableOrUnknown(
          data['follow_up_note']!,
          _followUpNoteMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_device_at')) {
      context.handle(
        _followUpDeviceAtMeta,
        followUpDeviceAt.isAcceptableOrUnknown(
          data['follow_up_device_at']!,
          _followUpDeviceAtMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_received_at')) {
      context.handle(
        _followUpReceivedAtMeta,
        followUpReceivedAt.isAcceptableOrUnknown(
          data['follow_up_received_at']!,
          _followUpReceivedAtMeta,
        ),
      );
    }
    if (data.containsKey('follow_up_synced_late')) {
      context.handle(
        _followUpSyncedLateMeta,
        followUpSyncedLate.isAcceptableOrUnknown(
          data['follow_up_synced_late']!,
          _followUpSyncedLateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommitmentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommitmentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      organizationId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}organization_id'],
      ),
      roundTableId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}round_table_id'],
      ),
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      ),
      personId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}person_id'],
      ),
      deviceCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_created_at'],
      ),
      deviceModifiedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}device_modified_at'],
      ),
      receivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}received_at'],
      ),
      syncedLate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}synced_late'],
      ),
      archivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archived_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}updated_at'],
      ),
      valueId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_id'],
      ),
      actionText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}action_text'],
      ),
      measureText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}measure_text'],
      ),
      followUpSessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_session_id'],
      ),
      followUpStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_status'],
      ),
      followUpNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_note'],
      ),
      followUpDeviceAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_device_at'],
      ),
      followUpReceivedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}follow_up_received_at'],
      ),
      followUpSyncedLate: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}follow_up_synced_late'],
      ),
    );
  }

  @override
  $MemberCommitmentsTable createAlias(String alias) {
    return $MemberCommitmentsTable(attachedDatabase, alias);
  }
}

class CommitmentRow extends DataClass implements Insertable<CommitmentRow> {
  final String id;
  final String? organizationId;
  final String? roundTableId;
  final String? sessionId;
  final String? personId;
  final String? deviceCreatedAt;
  final String? deviceModifiedAt;
  final String? receivedAt;
  final bool? syncedLate;
  final String? archivedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? valueId;
  final String? actionText;
  final String? measureText;
  final String? followUpSessionId;
  final String? followUpStatus;
  final String? followUpNote;
  final String? followUpDeviceAt;
  final String? followUpReceivedAt;
  final bool? followUpSyncedLate;
  const CommitmentRow({
    required this.id,
    this.organizationId,
    this.roundTableId,
    this.sessionId,
    this.personId,
    this.deviceCreatedAt,
    this.deviceModifiedAt,
    this.receivedAt,
    this.syncedLate,
    this.archivedAt,
    this.createdAt,
    this.updatedAt,
    this.valueId,
    this.actionText,
    this.measureText,
    this.followUpSessionId,
    this.followUpStatus,
    this.followUpNote,
    this.followUpDeviceAt,
    this.followUpReceivedAt,
    this.followUpSyncedLate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || organizationId != null) {
      map['organization_id'] = Variable<String>(organizationId);
    }
    if (!nullToAbsent || roundTableId != null) {
      map['round_table_id'] = Variable<String>(roundTableId);
    }
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || personId != null) {
      map['person_id'] = Variable<String>(personId);
    }
    if (!nullToAbsent || deviceCreatedAt != null) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt);
    }
    if (!nullToAbsent || deviceModifiedAt != null) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt);
    }
    if (!nullToAbsent || receivedAt != null) {
      map['received_at'] = Variable<String>(receivedAt);
    }
    if (!nullToAbsent || syncedLate != null) {
      map['synced_late'] = Variable<bool>(syncedLate);
    }
    if (!nullToAbsent || archivedAt != null) {
      map['archived_at'] = Variable<String>(archivedAt);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<String>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<String>(updatedAt);
    }
    if (!nullToAbsent || valueId != null) {
      map['value_id'] = Variable<String>(valueId);
    }
    if (!nullToAbsent || actionText != null) {
      map['action_text'] = Variable<String>(actionText);
    }
    if (!nullToAbsent || measureText != null) {
      map['measure_text'] = Variable<String>(measureText);
    }
    if (!nullToAbsent || followUpSessionId != null) {
      map['follow_up_session_id'] = Variable<String>(followUpSessionId);
    }
    if (!nullToAbsent || followUpStatus != null) {
      map['follow_up_status'] = Variable<String>(followUpStatus);
    }
    if (!nullToAbsent || followUpNote != null) {
      map['follow_up_note'] = Variable<String>(followUpNote);
    }
    if (!nullToAbsent || followUpDeviceAt != null) {
      map['follow_up_device_at'] = Variable<String>(followUpDeviceAt);
    }
    if (!nullToAbsent || followUpReceivedAt != null) {
      map['follow_up_received_at'] = Variable<String>(followUpReceivedAt);
    }
    if (!nullToAbsent || followUpSyncedLate != null) {
      map['follow_up_synced_late'] = Variable<bool>(followUpSyncedLate);
    }
    return map;
  }

  MemberCommitmentsCompanion toCompanion(bool nullToAbsent) {
    return MemberCommitmentsCompanion(
      id: Value(id),
      organizationId: organizationId == null && nullToAbsent
          ? const Value.absent()
          : Value(organizationId),
      roundTableId: roundTableId == null && nullToAbsent
          ? const Value.absent()
          : Value(roundTableId),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      personId: personId == null && nullToAbsent
          ? const Value.absent()
          : Value(personId),
      deviceCreatedAt: deviceCreatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceCreatedAt),
      deviceModifiedAt: deviceModifiedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deviceModifiedAt),
      receivedAt: receivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(receivedAt),
      syncedLate: syncedLate == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedLate),
      archivedAt: archivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(archivedAt),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      valueId: valueId == null && nullToAbsent
          ? const Value.absent()
          : Value(valueId),
      actionText: actionText == null && nullToAbsent
          ? const Value.absent()
          : Value(actionText),
      measureText: measureText == null && nullToAbsent
          ? const Value.absent()
          : Value(measureText),
      followUpSessionId: followUpSessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpSessionId),
      followUpStatus: followUpStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpStatus),
      followUpNote: followUpNote == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpNote),
      followUpDeviceAt: followUpDeviceAt == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpDeviceAt),
      followUpReceivedAt: followUpReceivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpReceivedAt),
      followUpSyncedLate: followUpSyncedLate == null && nullToAbsent
          ? const Value.absent()
          : Value(followUpSyncedLate),
    );
  }

  factory CommitmentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommitmentRow(
      id: serializer.fromJson<String>(json['id']),
      organizationId: serializer.fromJson<String?>(json['organizationId']),
      roundTableId: serializer.fromJson<String?>(json['roundTableId']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      personId: serializer.fromJson<String?>(json['personId']),
      deviceCreatedAt: serializer.fromJson<String?>(json['deviceCreatedAt']),
      deviceModifiedAt: serializer.fromJson<String?>(json['deviceModifiedAt']),
      receivedAt: serializer.fromJson<String?>(json['receivedAt']),
      syncedLate: serializer.fromJson<bool?>(json['syncedLate']),
      archivedAt: serializer.fromJson<String?>(json['archivedAt']),
      createdAt: serializer.fromJson<String?>(json['createdAt']),
      updatedAt: serializer.fromJson<String?>(json['updatedAt']),
      valueId: serializer.fromJson<String?>(json['valueId']),
      actionText: serializer.fromJson<String?>(json['actionText']),
      measureText: serializer.fromJson<String?>(json['measureText']),
      followUpSessionId: serializer.fromJson<String?>(
        json['followUpSessionId'],
      ),
      followUpStatus: serializer.fromJson<String?>(json['followUpStatus']),
      followUpNote: serializer.fromJson<String?>(json['followUpNote']),
      followUpDeviceAt: serializer.fromJson<String?>(json['followUpDeviceAt']),
      followUpReceivedAt: serializer.fromJson<String?>(
        json['followUpReceivedAt'],
      ),
      followUpSyncedLate: serializer.fromJson<bool?>(
        json['followUpSyncedLate'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'organizationId': serializer.toJson<String?>(organizationId),
      'roundTableId': serializer.toJson<String?>(roundTableId),
      'sessionId': serializer.toJson<String?>(sessionId),
      'personId': serializer.toJson<String?>(personId),
      'deviceCreatedAt': serializer.toJson<String?>(deviceCreatedAt),
      'deviceModifiedAt': serializer.toJson<String?>(deviceModifiedAt),
      'receivedAt': serializer.toJson<String?>(receivedAt),
      'syncedLate': serializer.toJson<bool?>(syncedLate),
      'archivedAt': serializer.toJson<String?>(archivedAt),
      'createdAt': serializer.toJson<String?>(createdAt),
      'updatedAt': serializer.toJson<String?>(updatedAt),
      'valueId': serializer.toJson<String?>(valueId),
      'actionText': serializer.toJson<String?>(actionText),
      'measureText': serializer.toJson<String?>(measureText),
      'followUpSessionId': serializer.toJson<String?>(followUpSessionId),
      'followUpStatus': serializer.toJson<String?>(followUpStatus),
      'followUpNote': serializer.toJson<String?>(followUpNote),
      'followUpDeviceAt': serializer.toJson<String?>(followUpDeviceAt),
      'followUpReceivedAt': serializer.toJson<String?>(followUpReceivedAt),
      'followUpSyncedLate': serializer.toJson<bool?>(followUpSyncedLate),
    };
  }

  CommitmentRow copyWith({
    String? id,
    Value<String?> organizationId = const Value.absent(),
    Value<String?> roundTableId = const Value.absent(),
    Value<String?> sessionId = const Value.absent(),
    Value<String?> personId = const Value.absent(),
    Value<String?> deviceCreatedAt = const Value.absent(),
    Value<String?> deviceModifiedAt = const Value.absent(),
    Value<String?> receivedAt = const Value.absent(),
    Value<bool?> syncedLate = const Value.absent(),
    Value<String?> archivedAt = const Value.absent(),
    Value<String?> createdAt = const Value.absent(),
    Value<String?> updatedAt = const Value.absent(),
    Value<String?> valueId = const Value.absent(),
    Value<String?> actionText = const Value.absent(),
    Value<String?> measureText = const Value.absent(),
    Value<String?> followUpSessionId = const Value.absent(),
    Value<String?> followUpStatus = const Value.absent(),
    Value<String?> followUpNote = const Value.absent(),
    Value<String?> followUpDeviceAt = const Value.absent(),
    Value<String?> followUpReceivedAt = const Value.absent(),
    Value<bool?> followUpSyncedLate = const Value.absent(),
  }) => CommitmentRow(
    id: id ?? this.id,
    organizationId: organizationId.present
        ? organizationId.value
        : this.organizationId,
    roundTableId: roundTableId.present ? roundTableId.value : this.roundTableId,
    sessionId: sessionId.present ? sessionId.value : this.sessionId,
    personId: personId.present ? personId.value : this.personId,
    deviceCreatedAt: deviceCreatedAt.present
        ? deviceCreatedAt.value
        : this.deviceCreatedAt,
    deviceModifiedAt: deviceModifiedAt.present
        ? deviceModifiedAt.value
        : this.deviceModifiedAt,
    receivedAt: receivedAt.present ? receivedAt.value : this.receivedAt,
    syncedLate: syncedLate.present ? syncedLate.value : this.syncedLate,
    archivedAt: archivedAt.present ? archivedAt.value : this.archivedAt,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
    updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
    valueId: valueId.present ? valueId.value : this.valueId,
    actionText: actionText.present ? actionText.value : this.actionText,
    measureText: measureText.present ? measureText.value : this.measureText,
    followUpSessionId: followUpSessionId.present
        ? followUpSessionId.value
        : this.followUpSessionId,
    followUpStatus: followUpStatus.present
        ? followUpStatus.value
        : this.followUpStatus,
    followUpNote: followUpNote.present ? followUpNote.value : this.followUpNote,
    followUpDeviceAt: followUpDeviceAt.present
        ? followUpDeviceAt.value
        : this.followUpDeviceAt,
    followUpReceivedAt: followUpReceivedAt.present
        ? followUpReceivedAt.value
        : this.followUpReceivedAt,
    followUpSyncedLate: followUpSyncedLate.present
        ? followUpSyncedLate.value
        : this.followUpSyncedLate,
  );
  CommitmentRow copyWithCompanion(MemberCommitmentsCompanion data) {
    return CommitmentRow(
      id: data.id.present ? data.id.value : this.id,
      organizationId: data.organizationId.present
          ? data.organizationId.value
          : this.organizationId,
      roundTableId: data.roundTableId.present
          ? data.roundTableId.value
          : this.roundTableId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      personId: data.personId.present ? data.personId.value : this.personId,
      deviceCreatedAt: data.deviceCreatedAt.present
          ? data.deviceCreatedAt.value
          : this.deviceCreatedAt,
      deviceModifiedAt: data.deviceModifiedAt.present
          ? data.deviceModifiedAt.value
          : this.deviceModifiedAt,
      receivedAt: data.receivedAt.present
          ? data.receivedAt.value
          : this.receivedAt,
      syncedLate: data.syncedLate.present
          ? data.syncedLate.value
          : this.syncedLate,
      archivedAt: data.archivedAt.present
          ? data.archivedAt.value
          : this.archivedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      valueId: data.valueId.present ? data.valueId.value : this.valueId,
      actionText: data.actionText.present
          ? data.actionText.value
          : this.actionText,
      measureText: data.measureText.present
          ? data.measureText.value
          : this.measureText,
      followUpSessionId: data.followUpSessionId.present
          ? data.followUpSessionId.value
          : this.followUpSessionId,
      followUpStatus: data.followUpStatus.present
          ? data.followUpStatus.value
          : this.followUpStatus,
      followUpNote: data.followUpNote.present
          ? data.followUpNote.value
          : this.followUpNote,
      followUpDeviceAt: data.followUpDeviceAt.present
          ? data.followUpDeviceAt.value
          : this.followUpDeviceAt,
      followUpReceivedAt: data.followUpReceivedAt.present
          ? data.followUpReceivedAt.value
          : this.followUpReceivedAt,
      followUpSyncedLate: data.followUpSyncedLate.present
          ? data.followUpSyncedLate.value
          : this.followUpSyncedLate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommitmentRow(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('valueId: $valueId, ')
          ..write('actionText: $actionText, ')
          ..write('measureText: $measureText, ')
          ..write('followUpSessionId: $followUpSessionId, ')
          ..write('followUpStatus: $followUpStatus, ')
          ..write('followUpNote: $followUpNote, ')
          ..write('followUpDeviceAt: $followUpDeviceAt, ')
          ..write('followUpReceivedAt: $followUpReceivedAt, ')
          ..write('followUpSyncedLate: $followUpSyncedLate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    organizationId,
    roundTableId,
    sessionId,
    personId,
    deviceCreatedAt,
    deviceModifiedAt,
    receivedAt,
    syncedLate,
    archivedAt,
    createdAt,
    updatedAt,
    valueId,
    actionText,
    measureText,
    followUpSessionId,
    followUpStatus,
    followUpNote,
    followUpDeviceAt,
    followUpReceivedAt,
    followUpSyncedLate,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommitmentRow &&
          other.id == this.id &&
          other.organizationId == this.organizationId &&
          other.roundTableId == this.roundTableId &&
          other.sessionId == this.sessionId &&
          other.personId == this.personId &&
          other.deviceCreatedAt == this.deviceCreatedAt &&
          other.deviceModifiedAt == this.deviceModifiedAt &&
          other.receivedAt == this.receivedAt &&
          other.syncedLate == this.syncedLate &&
          other.archivedAt == this.archivedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.valueId == this.valueId &&
          other.actionText == this.actionText &&
          other.measureText == this.measureText &&
          other.followUpSessionId == this.followUpSessionId &&
          other.followUpStatus == this.followUpStatus &&
          other.followUpNote == this.followUpNote &&
          other.followUpDeviceAt == this.followUpDeviceAt &&
          other.followUpReceivedAt == this.followUpReceivedAt &&
          other.followUpSyncedLate == this.followUpSyncedLate);
}

class MemberCommitmentsCompanion extends UpdateCompanion<CommitmentRow> {
  final Value<String> id;
  final Value<String?> organizationId;
  final Value<String?> roundTableId;
  final Value<String?> sessionId;
  final Value<String?> personId;
  final Value<String?> deviceCreatedAt;
  final Value<String?> deviceModifiedAt;
  final Value<String?> receivedAt;
  final Value<bool?> syncedLate;
  final Value<String?> archivedAt;
  final Value<String?> createdAt;
  final Value<String?> updatedAt;
  final Value<String?> valueId;
  final Value<String?> actionText;
  final Value<String?> measureText;
  final Value<String?> followUpSessionId;
  final Value<String?> followUpStatus;
  final Value<String?> followUpNote;
  final Value<String?> followUpDeviceAt;
  final Value<String?> followUpReceivedAt;
  final Value<bool?> followUpSyncedLate;
  final Value<int> rowid;
  const MemberCommitmentsCompanion({
    this.id = const Value.absent(),
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.valueId = const Value.absent(),
    this.actionText = const Value.absent(),
    this.measureText = const Value.absent(),
    this.followUpSessionId = const Value.absent(),
    this.followUpStatus = const Value.absent(),
    this.followUpNote = const Value.absent(),
    this.followUpDeviceAt = const Value.absent(),
    this.followUpReceivedAt = const Value.absent(),
    this.followUpSyncedLate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MemberCommitmentsCompanion.insert({
    required String id,
    this.organizationId = const Value.absent(),
    this.roundTableId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.personId = const Value.absent(),
    this.deviceCreatedAt = const Value.absent(),
    this.deviceModifiedAt = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.syncedLate = const Value.absent(),
    this.archivedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.valueId = const Value.absent(),
    this.actionText = const Value.absent(),
    this.measureText = const Value.absent(),
    this.followUpSessionId = const Value.absent(),
    this.followUpStatus = const Value.absent(),
    this.followUpNote = const Value.absent(),
    this.followUpDeviceAt = const Value.absent(),
    this.followUpReceivedAt = const Value.absent(),
    this.followUpSyncedLate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CommitmentRow> custom({
    Expression<String>? id,
    Expression<String>? organizationId,
    Expression<String>? roundTableId,
    Expression<String>? sessionId,
    Expression<String>? personId,
    Expression<String>? deviceCreatedAt,
    Expression<String>? deviceModifiedAt,
    Expression<String>? receivedAt,
    Expression<bool>? syncedLate,
    Expression<String>? archivedAt,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<String>? valueId,
    Expression<String>? actionText,
    Expression<String>? measureText,
    Expression<String>? followUpSessionId,
    Expression<String>? followUpStatus,
    Expression<String>? followUpNote,
    Expression<String>? followUpDeviceAt,
    Expression<String>? followUpReceivedAt,
    Expression<bool>? followUpSyncedLate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (organizationId != null) 'organization_id': organizationId,
      if (roundTableId != null) 'round_table_id': roundTableId,
      if (sessionId != null) 'session_id': sessionId,
      if (personId != null) 'person_id': personId,
      if (deviceCreatedAt != null) 'device_created_at': deviceCreatedAt,
      if (deviceModifiedAt != null) 'device_modified_at': deviceModifiedAt,
      if (receivedAt != null) 'received_at': receivedAt,
      if (syncedLate != null) 'synced_late': syncedLate,
      if (archivedAt != null) 'archived_at': archivedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (valueId != null) 'value_id': valueId,
      if (actionText != null) 'action_text': actionText,
      if (measureText != null) 'measure_text': measureText,
      if (followUpSessionId != null) 'follow_up_session_id': followUpSessionId,
      if (followUpStatus != null) 'follow_up_status': followUpStatus,
      if (followUpNote != null) 'follow_up_note': followUpNote,
      if (followUpDeviceAt != null) 'follow_up_device_at': followUpDeviceAt,
      if (followUpReceivedAt != null)
        'follow_up_received_at': followUpReceivedAt,
      if (followUpSyncedLate != null)
        'follow_up_synced_late': followUpSyncedLate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MemberCommitmentsCompanion copyWith({
    Value<String>? id,
    Value<String?>? organizationId,
    Value<String?>? roundTableId,
    Value<String?>? sessionId,
    Value<String?>? personId,
    Value<String?>? deviceCreatedAt,
    Value<String?>? deviceModifiedAt,
    Value<String?>? receivedAt,
    Value<bool?>? syncedLate,
    Value<String?>? archivedAt,
    Value<String?>? createdAt,
    Value<String?>? updatedAt,
    Value<String?>? valueId,
    Value<String?>? actionText,
    Value<String?>? measureText,
    Value<String?>? followUpSessionId,
    Value<String?>? followUpStatus,
    Value<String?>? followUpNote,
    Value<String?>? followUpDeviceAt,
    Value<String?>? followUpReceivedAt,
    Value<bool?>? followUpSyncedLate,
    Value<int>? rowid,
  }) {
    return MemberCommitmentsCompanion(
      id: id ?? this.id,
      organizationId: organizationId ?? this.organizationId,
      roundTableId: roundTableId ?? this.roundTableId,
      sessionId: sessionId ?? this.sessionId,
      personId: personId ?? this.personId,
      deviceCreatedAt: deviceCreatedAt ?? this.deviceCreatedAt,
      deviceModifiedAt: deviceModifiedAt ?? this.deviceModifiedAt,
      receivedAt: receivedAt ?? this.receivedAt,
      syncedLate: syncedLate ?? this.syncedLate,
      archivedAt: archivedAt ?? this.archivedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      valueId: valueId ?? this.valueId,
      actionText: actionText ?? this.actionText,
      measureText: measureText ?? this.measureText,
      followUpSessionId: followUpSessionId ?? this.followUpSessionId,
      followUpStatus: followUpStatus ?? this.followUpStatus,
      followUpNote: followUpNote ?? this.followUpNote,
      followUpDeviceAt: followUpDeviceAt ?? this.followUpDeviceAt,
      followUpReceivedAt: followUpReceivedAt ?? this.followUpReceivedAt,
      followUpSyncedLate: followUpSyncedLate ?? this.followUpSyncedLate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (organizationId.present) {
      map['organization_id'] = Variable<String>(organizationId.value);
    }
    if (roundTableId.present) {
      map['round_table_id'] = Variable<String>(roundTableId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (personId.present) {
      map['person_id'] = Variable<String>(personId.value);
    }
    if (deviceCreatedAt.present) {
      map['device_created_at'] = Variable<String>(deviceCreatedAt.value);
    }
    if (deviceModifiedAt.present) {
      map['device_modified_at'] = Variable<String>(deviceModifiedAt.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<String>(receivedAt.value);
    }
    if (syncedLate.present) {
      map['synced_late'] = Variable<bool>(syncedLate.value);
    }
    if (archivedAt.present) {
      map['archived_at'] = Variable<String>(archivedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (valueId.present) {
      map['value_id'] = Variable<String>(valueId.value);
    }
    if (actionText.present) {
      map['action_text'] = Variable<String>(actionText.value);
    }
    if (measureText.present) {
      map['measure_text'] = Variable<String>(measureText.value);
    }
    if (followUpSessionId.present) {
      map['follow_up_session_id'] = Variable<String>(followUpSessionId.value);
    }
    if (followUpStatus.present) {
      map['follow_up_status'] = Variable<String>(followUpStatus.value);
    }
    if (followUpNote.present) {
      map['follow_up_note'] = Variable<String>(followUpNote.value);
    }
    if (followUpDeviceAt.present) {
      map['follow_up_device_at'] = Variable<String>(followUpDeviceAt.value);
    }
    if (followUpReceivedAt.present) {
      map['follow_up_received_at'] = Variable<String>(followUpReceivedAt.value);
    }
    if (followUpSyncedLate.present) {
      map['follow_up_synced_late'] = Variable<bool>(followUpSyncedLate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberCommitmentsCompanion(')
          ..write('id: $id, ')
          ..write('organizationId: $organizationId, ')
          ..write('roundTableId: $roundTableId, ')
          ..write('sessionId: $sessionId, ')
          ..write('personId: $personId, ')
          ..write('deviceCreatedAt: $deviceCreatedAt, ')
          ..write('deviceModifiedAt: $deviceModifiedAt, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('syncedLate: $syncedLate, ')
          ..write('archivedAt: $archivedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('valueId: $valueId, ')
          ..write('actionText: $actionText, ')
          ..write('measureText: $measureText, ')
          ..write('followUpSessionId: $followUpSessionId, ')
          ..write('followUpStatus: $followUpStatus, ')
          ..write('followUpNote: $followUpNote, ')
          ..write('followUpDeviceAt: $followUpDeviceAt, ')
          ..write('followUpReceivedAt: $followUpReceivedAt, ')
          ..write('followUpSyncedLate: $followUpSyncedLate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncUploadRejectionsTable extends SyncUploadRejections
    with TableInfo<$SyncUploadRejectionsTable, UploadRejectionRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncUploadRejectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tableNameValueMeta = const VerificationMeta(
    'tableNameValue',
  );
  @override
  late final GeneratedColumn<String> tableNameValue = GeneratedColumn<String>(
    'table_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rowIdMeta = const VerificationMeta('rowId');
  @override
  late final GeneratedColumn<String> rowId = GeneratedColumn<String>(
    'row_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rejectedAtMeta = const VerificationMeta(
    'rejectedAt',
  );
  @override
  late final GeneratedColumn<String> rejectedAt = GeneratedColumn<String>(
    'rejected_at',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    tableNameValue,
    rowId,
    code,
    message,
    rejectedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_upload_rejections';
  @override
  VerificationContext validateIntegrity(
    Insertable<UploadRejectionRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('table_name')) {
      context.handle(
        _tableNameValueMeta,
        tableNameValue.isAcceptableOrUnknown(
          data['table_name']!,
          _tableNameValueMeta,
        ),
      );
    }
    if (data.containsKey('row_id')) {
      context.handle(
        _rowIdMeta,
        rowId.isAcceptableOrUnknown(data['row_id']!, _rowIdMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    }
    if (data.containsKey('rejected_at')) {
      context.handle(
        _rejectedAtMeta,
        rejectedAt.isAcceptableOrUnknown(data['rejected_at']!, _rejectedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UploadRejectionRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UploadRejectionRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      tableNameValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}table_name'],
      ),
      rowId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}row_id'],
      ),
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      ),
      rejectedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rejected_at'],
      ),
    );
  }

  @override
  $SyncUploadRejectionsTable createAlias(String alias) {
    return $SyncUploadRejectionsTable(attachedDatabase, alias);
  }
}

class UploadRejectionRow extends DataClass
    implements Insertable<UploadRejectionRow> {
  final String id;
  final String? tableNameValue;
  final String? rowId;
  final String? code;
  final String? message;
  final String? rejectedAt;
  const UploadRejectionRow({
    required this.id,
    this.tableNameValue,
    this.rowId,
    this.code,
    this.message,
    this.rejectedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || tableNameValue != null) {
      map['table_name'] = Variable<String>(tableNameValue);
    }
    if (!nullToAbsent || rowId != null) {
      map['row_id'] = Variable<String>(rowId);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || message != null) {
      map['message'] = Variable<String>(message);
    }
    if (!nullToAbsent || rejectedAt != null) {
      map['rejected_at'] = Variable<String>(rejectedAt);
    }
    return map;
  }

  SyncUploadRejectionsCompanion toCompanion(bool nullToAbsent) {
    return SyncUploadRejectionsCompanion(
      id: Value(id),
      tableNameValue: tableNameValue == null && nullToAbsent
          ? const Value.absent()
          : Value(tableNameValue),
      rowId: rowId == null && nullToAbsent
          ? const Value.absent()
          : Value(rowId),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      message: message == null && nullToAbsent
          ? const Value.absent()
          : Value(message),
      rejectedAt: rejectedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(rejectedAt),
    );
  }

  factory UploadRejectionRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UploadRejectionRow(
      id: serializer.fromJson<String>(json['id']),
      tableNameValue: serializer.fromJson<String?>(json['tableNameValue']),
      rowId: serializer.fromJson<String?>(json['rowId']),
      code: serializer.fromJson<String?>(json['code']),
      message: serializer.fromJson<String?>(json['message']),
      rejectedAt: serializer.fromJson<String?>(json['rejectedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tableNameValue': serializer.toJson<String?>(tableNameValue),
      'rowId': serializer.toJson<String?>(rowId),
      'code': serializer.toJson<String?>(code),
      'message': serializer.toJson<String?>(message),
      'rejectedAt': serializer.toJson<String?>(rejectedAt),
    };
  }

  UploadRejectionRow copyWith({
    String? id,
    Value<String?> tableNameValue = const Value.absent(),
    Value<String?> rowId = const Value.absent(),
    Value<String?> code = const Value.absent(),
    Value<String?> message = const Value.absent(),
    Value<String?> rejectedAt = const Value.absent(),
  }) => UploadRejectionRow(
    id: id ?? this.id,
    tableNameValue: tableNameValue.present
        ? tableNameValue.value
        : this.tableNameValue,
    rowId: rowId.present ? rowId.value : this.rowId,
    code: code.present ? code.value : this.code,
    message: message.present ? message.value : this.message,
    rejectedAt: rejectedAt.present ? rejectedAt.value : this.rejectedAt,
  );
  UploadRejectionRow copyWithCompanion(SyncUploadRejectionsCompanion data) {
    return UploadRejectionRow(
      id: data.id.present ? data.id.value : this.id,
      tableNameValue: data.tableNameValue.present
          ? data.tableNameValue.value
          : this.tableNameValue,
      rowId: data.rowId.present ? data.rowId.value : this.rowId,
      code: data.code.present ? data.code.value : this.code,
      message: data.message.present ? data.message.value : this.message,
      rejectedAt: data.rejectedAt.present
          ? data.rejectedAt.value
          : this.rejectedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UploadRejectionRow(')
          ..write('id: $id, ')
          ..write('tableNameValue: $tableNameValue, ')
          ..write('rowId: $rowId, ')
          ..write('code: $code, ')
          ..write('message: $message, ')
          ..write('rejectedAt: $rejectedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, tableNameValue, rowId, code, message, rejectedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UploadRejectionRow &&
          other.id == this.id &&
          other.tableNameValue == this.tableNameValue &&
          other.rowId == this.rowId &&
          other.code == this.code &&
          other.message == this.message &&
          other.rejectedAt == this.rejectedAt);
}

class SyncUploadRejectionsCompanion
    extends UpdateCompanion<UploadRejectionRow> {
  final Value<String> id;
  final Value<String?> tableNameValue;
  final Value<String?> rowId;
  final Value<String?> code;
  final Value<String?> message;
  final Value<String?> rejectedAt;
  final Value<int> rowid;
  const SyncUploadRejectionsCompanion({
    this.id = const Value.absent(),
    this.tableNameValue = const Value.absent(),
    this.rowId = const Value.absent(),
    this.code = const Value.absent(),
    this.message = const Value.absent(),
    this.rejectedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncUploadRejectionsCompanion.insert({
    required String id,
    this.tableNameValue = const Value.absent(),
    this.rowId = const Value.absent(),
    this.code = const Value.absent(),
    this.message = const Value.absent(),
    this.rejectedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<UploadRejectionRow> custom({
    Expression<String>? id,
    Expression<String>? tableNameValue,
    Expression<String>? rowId,
    Expression<String>? code,
    Expression<String>? message,
    Expression<String>? rejectedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tableNameValue != null) 'table_name': tableNameValue,
      if (rowId != null) 'row_id': rowId,
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (rejectedAt != null) 'rejected_at': rejectedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncUploadRejectionsCompanion copyWith({
    Value<String>? id,
    Value<String?>? tableNameValue,
    Value<String?>? rowId,
    Value<String?>? code,
    Value<String?>? message,
    Value<String?>? rejectedAt,
    Value<int>? rowid,
  }) {
    return SyncUploadRejectionsCompanion(
      id: id ?? this.id,
      tableNameValue: tableNameValue ?? this.tableNameValue,
      rowId: rowId ?? this.rowId,
      code: code ?? this.code,
      message: message ?? this.message,
      rejectedAt: rejectedAt ?? this.rejectedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tableNameValue.present) {
      map['table_name'] = Variable<String>(tableNameValue.value);
    }
    if (rowId.present) {
      map['row_id'] = Variable<String>(rowId.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (rejectedAt.present) {
      map['rejected_at'] = Variable<String>(rejectedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncUploadRejectionsCompanion(')
          ..write('id: $id, ')
          ..write('tableNameValue: $tableNameValue, ')
          ..write('rowId: $rowId, ')
          ..write('code: $code, ')
          ..write('message: $message, ')
          ..write('rejectedAt: $rejectedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$SessionDriftDatabase extends GeneratedDatabase {
  _$SessionDriftDatabase(QueryExecutor e) : super(e);
  $SessionDriftDatabaseManager get managers =>
      $SessionDriftDatabaseManager(this);
  late final $CurriculumValuesTable curriculumValues = $CurriculumValuesTable(
    this,
  );
  late final $ValueQuestionsTable valueQuestions = $ValueQuestionsTable(this);
  late final $OrganizationsTable organizations = $OrganizationsTable(this);
  late final $PeopleTable people = $PeopleTable(this);
  late final $RoundTablesTable roundTables = $RoundTablesTable(this);
  late final $TableMembersTable tableMembers = $TableMembersTable(this);
  late final $SessionsTable sessions = $SessionsTable(this);
  late final $SessionAttendanceTable sessionAttendance =
      $SessionAttendanceTable(this);
  late final $MemberAssessmentsTable memberAssessments =
      $MemberAssessmentsTable(this);
  late final $MemberAnswersTable memberAnswers = $MemberAnswersTable(this);
  late final $MemberCommitmentsTable memberCommitments =
      $MemberCommitmentsTable(this);
  late final $SyncUploadRejectionsTable syncUploadRejections =
      $SyncUploadRejectionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    curriculumValues,
    valueQuestions,
    organizations,
    people,
    roundTables,
    tableMembers,
    sessions,
    sessionAttendance,
    memberAssessments,
    memberAnswers,
    memberCommitments,
    syncUploadRejections,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$CurriculumValuesTableCreateCompanionBuilder =
    CurriculumValuesCompanion Function({
      required String id,
      Value<String?> moduleId,
      Value<int?> numberInModule,
      Value<int?> sequence,
      Value<String?> name,
      Value<String?> description,
      Value<String?> bookletReference,
      Value<String?> status,
      Value<int> rowid,
    });
typedef $$CurriculumValuesTableUpdateCompanionBuilder =
    CurriculumValuesCompanion Function({
      Value<String> id,
      Value<String?> moduleId,
      Value<int?> numberInModule,
      Value<int?> sequence,
      Value<String?> name,
      Value<String?> description,
      Value<String?> bookletReference,
      Value<String?> status,
      Value<int> rowid,
    });

class $$CurriculumValuesTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $CurriculumValuesTable> {
  $$CurriculumValuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moduleId => $composableBuilder(
    column: $table.moduleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberInModule => $composableBuilder(
    column: $table.numberInModule,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bookletReference => $composableBuilder(
    column: $table.bookletReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CurriculumValuesTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $CurriculumValuesTable> {
  $$CurriculumValuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moduleId => $composableBuilder(
    column: $table.moduleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberInModule => $composableBuilder(
    column: $table.numberInModule,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sequence => $composableBuilder(
    column: $table.sequence,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bookletReference => $composableBuilder(
    column: $table.bookletReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CurriculumValuesTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $CurriculumValuesTable> {
  $$CurriculumValuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get moduleId =>
      $composableBuilder(column: $table.moduleId, builder: (column) => column);

  GeneratedColumn<int> get numberInModule => $composableBuilder(
    column: $table.numberInModule,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sequence =>
      $composableBuilder(column: $table.sequence, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bookletReference => $composableBuilder(
    column: $table.bookletReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$CurriculumValuesTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $CurriculumValuesTable,
          ValueRow,
          $$CurriculumValuesTableFilterComposer,
          $$CurriculumValuesTableOrderingComposer,
          $$CurriculumValuesTableAnnotationComposer,
          $$CurriculumValuesTableCreateCompanionBuilder,
          $$CurriculumValuesTableUpdateCompanionBuilder,
          (
            ValueRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $CurriculumValuesTable,
              ValueRow
            >,
          ),
          ValueRow,
          PrefetchHooks Function()
        > {
  $$CurriculumValuesTableTableManager(
    _$SessionDriftDatabase db,
    $CurriculumValuesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurriculumValuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurriculumValuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CurriculumValuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> moduleId = const Value.absent(),
                Value<int?> numberInModule = const Value.absent(),
                Value<int?> sequence = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> bookletReference = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurriculumValuesCompanion(
                id: id,
                moduleId: moduleId,
                numberInModule: numberInModule,
                sequence: sequence,
                name: name,
                description: description,
                bookletReference: bookletReference,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> moduleId = const Value.absent(),
                Value<int?> numberInModule = const Value.absent(),
                Value<int?> sequence = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> bookletReference = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CurriculumValuesCompanion.insert(
                id: id,
                moduleId: moduleId,
                numberInModule: numberInModule,
                sequence: sequence,
                name: name,
                description: description,
                bookletReference: bookletReference,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CurriculumValuesTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $CurriculumValuesTable,
      ValueRow,
      $$CurriculumValuesTableFilterComposer,
      $$CurriculumValuesTableOrderingComposer,
      $$CurriculumValuesTableAnnotationComposer,
      $$CurriculumValuesTableCreateCompanionBuilder,
      $$CurriculumValuesTableUpdateCompanionBuilder,
      (
        ValueRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $CurriculumValuesTable,
          ValueRow
        >,
      ),
      ValueRow,
      PrefetchHooks Function()
    >;
typedef $$ValueQuestionsTableCreateCompanionBuilder =
    ValueQuestionsCompanion Function({
      required String id,
      Value<String?> valueId,
      Value<String?> questionCode,
      Value<String?> questionText,
      Value<int?> sortOrder,
      Value<String?> responseType,
      Value<String?> status,
      Value<int> rowid,
    });
typedef $$ValueQuestionsTableUpdateCompanionBuilder =
    ValueQuestionsCompanion Function({
      Value<String> id,
      Value<String?> valueId,
      Value<String?> questionCode,
      Value<String?> questionText,
      Value<int?> sortOrder,
      Value<String?> responseType,
      Value<String?> status,
      Value<int> rowid,
    });

class $$ValueQuestionsTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $ValueQuestionsTable> {
  $$ValueQuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionCode => $composableBuilder(
    column: $table.questionCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get responseType => $composableBuilder(
    column: $table.responseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ValueQuestionsTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $ValueQuestionsTable> {
  $$ValueQuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionCode => $composableBuilder(
    column: $table.questionCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get responseType => $composableBuilder(
    column: $table.responseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ValueQuestionsTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $ValueQuestionsTable> {
  $$ValueQuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get valueId =>
      $composableBuilder(column: $table.valueId, builder: (column) => column);

  GeneratedColumn<String> get questionCode => $composableBuilder(
    column: $table.questionCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<String> get responseType => $composableBuilder(
    column: $table.responseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$ValueQuestionsTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $ValueQuestionsTable,
          QuestionRow,
          $$ValueQuestionsTableFilterComposer,
          $$ValueQuestionsTableOrderingComposer,
          $$ValueQuestionsTableAnnotationComposer,
          $$ValueQuestionsTableCreateCompanionBuilder,
          $$ValueQuestionsTableUpdateCompanionBuilder,
          (
            QuestionRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $ValueQuestionsTable,
              QuestionRow
            >,
          ),
          QuestionRow,
          PrefetchHooks Function()
        > {
  $$ValueQuestionsTableTableManager(
    _$SessionDriftDatabase db,
    $ValueQuestionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ValueQuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ValueQuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ValueQuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> questionCode = const Value.absent(),
                Value<String?> questionText = const Value.absent(),
                Value<int?> sortOrder = const Value.absent(),
                Value<String?> responseType = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ValueQuestionsCompanion(
                id: id,
                valueId: valueId,
                questionCode: questionCode,
                questionText: questionText,
                sortOrder: sortOrder,
                responseType: responseType,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> valueId = const Value.absent(),
                Value<String?> questionCode = const Value.absent(),
                Value<String?> questionText = const Value.absent(),
                Value<int?> sortOrder = const Value.absent(),
                Value<String?> responseType = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ValueQuestionsCompanion.insert(
                id: id,
                valueId: valueId,
                questionCode: questionCode,
                questionText: questionText,
                sortOrder: sortOrder,
                responseType: responseType,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ValueQuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $ValueQuestionsTable,
      QuestionRow,
      $$ValueQuestionsTableFilterComposer,
      $$ValueQuestionsTableOrderingComposer,
      $$ValueQuestionsTableAnnotationComposer,
      $$ValueQuestionsTableCreateCompanionBuilder,
      $$ValueQuestionsTableUpdateCompanionBuilder,
      (
        QuestionRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $ValueQuestionsTable,
          QuestionRow
        >,
      ),
      QuestionRow,
      PrefetchHooks Function()
    >;
typedef $$OrganizationsTableCreateCompanionBuilder =
    OrganizationsCompanion Function({
      required String id,
      Value<String?> name,
      Value<String?> kind,
      Value<String?> countryCode,
      Value<String?> countryName,
      Value<String?> region,
      Value<String?> status,
      Value<int> rowid,
    });
typedef $$OrganizationsTableUpdateCompanionBuilder =
    OrganizationsCompanion Function({
      Value<String> id,
      Value<String?> name,
      Value<String?> kind,
      Value<String?> countryCode,
      Value<String?> countryName,
      Value<String?> region,
      Value<String?> status,
      Value<int> rowid,
    });

class $$OrganizationsTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $OrganizationsTable> {
  $$OrganizationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$OrganizationsTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $OrganizationsTable> {
  $$OrganizationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get region => $composableBuilder(
    column: $table.region,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$OrganizationsTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $OrganizationsTable> {
  $$OrganizationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get countryCode => $composableBuilder(
    column: $table.countryCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get countryName => $composableBuilder(
    column: $table.countryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get region =>
      $composableBuilder(column: $table.region, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$OrganizationsTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $OrganizationsTable,
          OrganizationRow,
          $$OrganizationsTableFilterComposer,
          $$OrganizationsTableOrderingComposer,
          $$OrganizationsTableAnnotationComposer,
          $$OrganizationsTableCreateCompanionBuilder,
          $$OrganizationsTableUpdateCompanionBuilder,
          (
            OrganizationRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $OrganizationsTable,
              OrganizationRow
            >,
          ),
          OrganizationRow,
          PrefetchHooks Function()
        > {
  $$OrganizationsTableTableManager(
    _$SessionDriftDatabase db,
    $OrganizationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrganizationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrganizationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrganizationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> kind = const Value.absent(),
                Value<String?> countryCode = const Value.absent(),
                Value<String?> countryName = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrganizationsCompanion(
                id: id,
                name: name,
                kind: kind,
                countryCode: countryCode,
                countryName: countryName,
                region: region,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> name = const Value.absent(),
                Value<String?> kind = const Value.absent(),
                Value<String?> countryCode = const Value.absent(),
                Value<String?> countryName = const Value.absent(),
                Value<String?> region = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => OrganizationsCompanion.insert(
                id: id,
                name: name,
                kind: kind,
                countryCode: countryCode,
                countryName: countryName,
                region: region,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$OrganizationsTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $OrganizationsTable,
      OrganizationRow,
      $$OrganizationsTableFilterComposer,
      $$OrganizationsTableOrderingComposer,
      $$OrganizationsTableAnnotationComposer,
      $$OrganizationsTableCreateCompanionBuilder,
      $$OrganizationsTableUpdateCompanionBuilder,
      (
        OrganizationRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $OrganizationsTable,
          OrganizationRow
        >,
      ),
      OrganizationRow,
      PrefetchHooks Function()
    >;
typedef $$PeopleTableCreateCompanionBuilder =
    PeopleCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> position,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> status,
      Value<int> rowid,
    });
typedef $$PeopleTableUpdateCompanionBuilder =
    PeopleCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<String?> position,
      Value<String?> email,
      Value<String?> phone,
      Value<String?> status,
      Value<int> rowid,
    });

class $$PeopleTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $PeopleTable> {
  $$PeopleTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PeopleTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $PeopleTable> {
  $$PeopleTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get position => $composableBuilder(
    column: $table.position,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PeopleTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $PeopleTable> {
  $$PeopleTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get position =>
      $composableBuilder(column: $table.position, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$PeopleTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $PeopleTable,
          PersonRow,
          $$PeopleTableFilterComposer,
          $$PeopleTableOrderingComposer,
          $$PeopleTableAnnotationComposer,
          $$PeopleTableCreateCompanionBuilder,
          $$PeopleTableUpdateCompanionBuilder,
          (
            PersonRow,
            BaseReferences<_$SessionDriftDatabase, $PeopleTable, PersonRow>,
          ),
          PersonRow,
          PrefetchHooks Function()
        > {
  $$PeopleTableTableManager(_$SessionDriftDatabase db, $PeopleTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PeopleTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PeopleTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PeopleTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion(
                id: id,
                organizationId: organizationId,
                firstName: firstName,
                lastName: lastName,
                position: position,
                email: email,
                phone: phone,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<String?> position = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PeopleCompanion.insert(
                id: id,
                organizationId: organizationId,
                firstName: firstName,
                lastName: lastName,
                position: position,
                email: email,
                phone: phone,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PeopleTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $PeopleTable,
      PersonRow,
      $$PeopleTableFilterComposer,
      $$PeopleTableOrderingComposer,
      $$PeopleTableAnnotationComposer,
      $$PeopleTableCreateCompanionBuilder,
      $$PeopleTableUpdateCompanionBuilder,
      (
        PersonRow,
        BaseReferences<_$SessionDriftDatabase, $PeopleTable, PersonRow>,
      ),
      PersonRow,
      PrefetchHooks Function()
    >;
typedef $$RoundTablesTableCreateCompanionBuilder =
    RoundTablesCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> locationId,
      Value<String?> name,
      Value<String?> code,
      Value<int?> weekday,
      Value<String?> startTime,
      Value<String?> timezone,
      Value<int?> durationMinutes,
      Value<String?> status,
      Value<String?> currentValueId,
      Value<int> rowid,
    });
typedef $$RoundTablesTableUpdateCompanionBuilder =
    RoundTablesCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> locationId,
      Value<String?> name,
      Value<String?> code,
      Value<int?> weekday,
      Value<String?> startTime,
      Value<String?> timezone,
      Value<int?> durationMinutes,
      Value<String?> status,
      Value<String?> currentValueId,
      Value<int> rowid,
    });

class $$RoundTablesTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $RoundTablesTable> {
  $$RoundTablesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationId => $composableBuilder(
    column: $table.locationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentValueId => $composableBuilder(
    column: $table.currentValueId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RoundTablesTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $RoundTablesTable> {
  $$RoundTablesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationId => $composableBuilder(
    column: $table.locationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timezone => $composableBuilder(
    column: $table.timezone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentValueId => $composableBuilder(
    column: $table.currentValueId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoundTablesTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $RoundTablesTable> {
  $$RoundTablesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationId => $composableBuilder(
    column: $table.locationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<int> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get timezone =>
      $composableBuilder(column: $table.timezone, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get currentValueId => $composableBuilder(
    column: $table.currentValueId,
    builder: (column) => column,
  );
}

class $$RoundTablesTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $RoundTablesTable,
          RoundTableRow,
          $$RoundTablesTableFilterComposer,
          $$RoundTablesTableOrderingComposer,
          $$RoundTablesTableAnnotationComposer,
          $$RoundTablesTableCreateCompanionBuilder,
          $$RoundTablesTableUpdateCompanionBuilder,
          (
            RoundTableRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $RoundTablesTable,
              RoundTableRow
            >,
          ),
          RoundTableRow,
          PrefetchHooks Function()
        > {
  $$RoundTablesTableTableManager(
    _$SessionDriftDatabase db,
    $RoundTablesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoundTablesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoundTablesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoundTablesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> locationId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<int?> weekday = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> timezone = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> currentValueId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoundTablesCompanion(
                id: id,
                organizationId: organizationId,
                locationId: locationId,
                name: name,
                code: code,
                weekday: weekday,
                startTime: startTime,
                timezone: timezone,
                durationMinutes: durationMinutes,
                status: status,
                currentValueId: currentValueId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> locationId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<int?> weekday = const Value.absent(),
                Value<String?> startTime = const Value.absent(),
                Value<String?> timezone = const Value.absent(),
                Value<int?> durationMinutes = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> currentValueId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoundTablesCompanion.insert(
                id: id,
                organizationId: organizationId,
                locationId: locationId,
                name: name,
                code: code,
                weekday: weekday,
                startTime: startTime,
                timezone: timezone,
                durationMinutes: durationMinutes,
                status: status,
                currentValueId: currentValueId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RoundTablesTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $RoundTablesTable,
      RoundTableRow,
      $$RoundTablesTableFilterComposer,
      $$RoundTablesTableOrderingComposer,
      $$RoundTablesTableAnnotationComposer,
      $$RoundTablesTableCreateCompanionBuilder,
      $$RoundTablesTableUpdateCompanionBuilder,
      (
        RoundTableRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $RoundTablesTable,
          RoundTableRow
        >,
      ),
      RoundTableRow,
      PrefetchHooks Function()
    >;
typedef $$TableMembersTableCreateCompanionBuilder =
    TableMembersCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> personId,
      Value<String?> role,
      Value<String?> joinedAt,
      Value<String?> leftAt,
      Value<String?> leftReason,
      Value<String?> status,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<int> rowid,
    });
typedef $$TableMembersTableUpdateCompanionBuilder =
    TableMembersCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> personId,
      Value<String?> role,
      Value<String?> joinedAt,
      Value<String?> leftAt,
      Value<String?> leftReason,
      Value<String?> status,
      Value<String?> firstName,
      Value<String?> lastName,
      Value<int> rowid,
    });

class $$TableMembersTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $TableMembersTable> {
  $$TableMembersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get joinedAt => $composableBuilder(
    column: $table.joinedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get leftAt => $composableBuilder(
    column: $table.leftAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get leftReason => $composableBuilder(
    column: $table.leftReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TableMembersTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $TableMembersTable> {
  $$TableMembersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get joinedAt => $composableBuilder(
    column: $table.joinedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get leftAt => $composableBuilder(
    column: $table.leftAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get leftReason => $composableBuilder(
    column: $table.leftReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TableMembersTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $TableMembersTable> {
  $$TableMembersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get personId =>
      $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get joinedAt =>
      $composableBuilder(column: $table.joinedAt, builder: (column) => column);

  GeneratedColumn<String> get leftAt =>
      $composableBuilder(column: $table.leftAt, builder: (column) => column);

  GeneratedColumn<String> get leftReason => $composableBuilder(
    column: $table.leftReason,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);
}

class $$TableMembersTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $TableMembersTable,
          TableMemberRow,
          $$TableMembersTableFilterComposer,
          $$TableMembersTableOrderingComposer,
          $$TableMembersTableAnnotationComposer,
          $$TableMembersTableCreateCompanionBuilder,
          $$TableMembersTableUpdateCompanionBuilder,
          (
            TableMemberRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $TableMembersTable,
              TableMemberRow
            >,
          ),
          TableMemberRow,
          PrefetchHooks Function()
        > {
  $$TableMembersTableTableManager(
    _$SessionDriftDatabase db,
    $TableMembersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TableMembersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TableMembersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TableMembersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<String?> joinedAt = const Value.absent(),
                Value<String?> leftAt = const Value.absent(),
                Value<String?> leftReason = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TableMembersCompanion(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                personId: personId,
                role: role,
                joinedAt: joinedAt,
                leftAt: leftAt,
                leftReason: leftReason,
                status: status,
                firstName: firstName,
                lastName: lastName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> role = const Value.absent(),
                Value<String?> joinedAt = const Value.absent(),
                Value<String?> leftAt = const Value.absent(),
                Value<String?> leftReason = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
                Value<String?> lastName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TableMembersCompanion.insert(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                personId: personId,
                role: role,
                joinedAt: joinedAt,
                leftAt: leftAt,
                leftReason: leftReason,
                status: status,
                firstName: firstName,
                lastName: lastName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TableMembersTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $TableMembersTable,
      TableMemberRow,
      $$TableMembersTableFilterComposer,
      $$TableMembersTableOrderingComposer,
      $$TableMembersTableAnnotationComposer,
      $$TableMembersTableCreateCompanionBuilder,
      $$TableMembersTableUpdateCompanionBuilder,
      (
        TableMemberRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $TableMembersTable,
          TableMemberRow
        >,
      ),
      TableMemberRow,
      PrefetchHooks Function()
    >;
typedef $$SessionsTableCreateCompanionBuilder =
    SessionsCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> valueId,
      Value<String?> followUpValueId,
      Value<String?> status,
      Value<String?> stage,
      Value<String?> scheduledAt,
      Value<String?> startedAt,
      Value<String?> endedAt,
      Value<String?> answersClosedAt,
      Value<String?> cancelledReason,
      Value<String?> facilitatorPersonId,
      Value<String?> deviceModifiedAt,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<int> rowid,
    });
typedef $$SessionsTableUpdateCompanionBuilder =
    SessionsCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> valueId,
      Value<String?> followUpValueId,
      Value<String?> status,
      Value<String?> stage,
      Value<String?> scheduledAt,
      Value<String?> startedAt,
      Value<String?> endedAt,
      Value<String?> answersClosedAt,
      Value<String?> cancelledReason,
      Value<String?> facilitatorPersonId,
      Value<String?> deviceModifiedAt,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<int> rowid,
    });

class $$SessionsTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $SessionsTable> {
  $$SessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpValueId => $composableBuilder(
    column: $table.followUpValueId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answersClosedAt => $composableBuilder(
    column: $table.answersClosedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cancelledReason => $composableBuilder(
    column: $table.cancelledReason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get facilitatorPersonId => $composableBuilder(
    column: $table.facilitatorPersonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionsTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $SessionsTable> {
  $$SessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpValueId => $composableBuilder(
    column: $table.followUpValueId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stage => $composableBuilder(
    column: $table.stage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endedAt => $composableBuilder(
    column: $table.endedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answersClosedAt => $composableBuilder(
    column: $table.answersClosedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cancelledReason => $composableBuilder(
    column: $table.cancelledReason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get facilitatorPersonId => $composableBuilder(
    column: $table.facilitatorPersonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionsTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $SessionsTable> {
  $$SessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get valueId =>
      $composableBuilder(column: $table.valueId, builder: (column) => column);

  GeneratedColumn<String> get followUpValueId => $composableBuilder(
    column: $table.followUpValueId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get stage =>
      $composableBuilder(column: $table.stage, builder: (column) => column);

  GeneratedColumn<String> get scheduledAt => $composableBuilder(
    column: $table.scheduledAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<String> get endedAt =>
      $composableBuilder(column: $table.endedAt, builder: (column) => column);

  GeneratedColumn<String> get answersClosedAt => $composableBuilder(
    column: $table.answersClosedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cancelledReason => $composableBuilder(
    column: $table.cancelledReason,
    builder: (column) => column,
  );

  GeneratedColumn<String> get facilitatorPersonId => $composableBuilder(
    column: $table.facilitatorPersonId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SessionsTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $SessionsTable,
          SessionRow,
          $$SessionsTableFilterComposer,
          $$SessionsTableOrderingComposer,
          $$SessionsTableAnnotationComposer,
          $$SessionsTableCreateCompanionBuilder,
          $$SessionsTableUpdateCompanionBuilder,
          (
            SessionRow,
            BaseReferences<_$SessionDriftDatabase, $SessionsTable, SessionRow>,
          ),
          SessionRow,
          PrefetchHooks Function()
        > {
  $$SessionsTableTableManager(_$SessionDriftDatabase db, $SessionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> followUpValueId = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> stage = const Value.absent(),
                Value<String?> scheduledAt = const Value.absent(),
                Value<String?> startedAt = const Value.absent(),
                Value<String?> endedAt = const Value.absent(),
                Value<String?> answersClosedAt = const Value.absent(),
                Value<String?> cancelledReason = const Value.absent(),
                Value<String?> facilitatorPersonId = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                valueId: valueId,
                followUpValueId: followUpValueId,
                status: status,
                stage: stage,
                scheduledAt: scheduledAt,
                startedAt: startedAt,
                endedAt: endedAt,
                answersClosedAt: answersClosedAt,
                cancelledReason: cancelledReason,
                facilitatorPersonId: facilitatorPersonId,
                deviceModifiedAt: deviceModifiedAt,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> followUpValueId = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> stage = const Value.absent(),
                Value<String?> scheduledAt = const Value.absent(),
                Value<String?> startedAt = const Value.absent(),
                Value<String?> endedAt = const Value.absent(),
                Value<String?> answersClosedAt = const Value.absent(),
                Value<String?> cancelledReason = const Value.absent(),
                Value<String?> facilitatorPersonId = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionsCompanion.insert(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                valueId: valueId,
                followUpValueId: followUpValueId,
                status: status,
                stage: stage,
                scheduledAt: scheduledAt,
                startedAt: startedAt,
                endedAt: endedAt,
                answersClosedAt: answersClosedAt,
                cancelledReason: cancelledReason,
                facilitatorPersonId: facilitatorPersonId,
                deviceModifiedAt: deviceModifiedAt,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $SessionsTable,
      SessionRow,
      $$SessionsTableFilterComposer,
      $$SessionsTableOrderingComposer,
      $$SessionsTableAnnotationComposer,
      $$SessionsTableCreateCompanionBuilder,
      $$SessionsTableUpdateCompanionBuilder,
      (
        SessionRow,
        BaseReferences<_$SessionDriftDatabase, $SessionsTable, SessionRow>,
      ),
      SessionRow,
      PrefetchHooks Function()
    >;
typedef $$SessionAttendanceTableCreateCompanionBuilder =
    SessionAttendanceCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> status,
      Value<String?> source,
      Value<String?> recordedByPersonId,
      Value<int> rowid,
    });
typedef $$SessionAttendanceTableUpdateCompanionBuilder =
    SessionAttendanceCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> status,
      Value<String?> source,
      Value<String?> recordedByPersonId,
      Value<int> rowid,
    });

class $$SessionAttendanceTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $SessionAttendanceTable> {
  $$SessionAttendanceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recordedByPersonId => $composableBuilder(
    column: $table.recordedByPersonId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SessionAttendanceTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $SessionAttendanceTable> {
  $$SessionAttendanceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recordedByPersonId => $composableBuilder(
    column: $table.recordedByPersonId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SessionAttendanceTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $SessionAttendanceTable> {
  $$SessionAttendanceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get personId =>
      $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get recordedByPersonId => $composableBuilder(
    column: $table.recordedByPersonId,
    builder: (column) => column,
  );
}

class $$SessionAttendanceTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $SessionAttendanceTable,
          AttendanceRow,
          $$SessionAttendanceTableFilterComposer,
          $$SessionAttendanceTableOrderingComposer,
          $$SessionAttendanceTableAnnotationComposer,
          $$SessionAttendanceTableCreateCompanionBuilder,
          $$SessionAttendanceTableUpdateCompanionBuilder,
          (
            AttendanceRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $SessionAttendanceTable,
              AttendanceRow
            >,
          ),
          AttendanceRow,
          PrefetchHooks Function()
        > {
  $$SessionAttendanceTableTableManager(
    _$SessionDriftDatabase db,
    $SessionAttendanceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SessionAttendanceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SessionAttendanceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SessionAttendanceTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String?> recordedByPersonId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionAttendanceCompanion(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                status: status,
                source: source,
                recordedByPersonId: recordedByPersonId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> status = const Value.absent(),
                Value<String?> source = const Value.absent(),
                Value<String?> recordedByPersonId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SessionAttendanceCompanion.insert(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                status: status,
                source: source,
                recordedByPersonId: recordedByPersonId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SessionAttendanceTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $SessionAttendanceTable,
      AttendanceRow,
      $$SessionAttendanceTableFilterComposer,
      $$SessionAttendanceTableOrderingComposer,
      $$SessionAttendanceTableAnnotationComposer,
      $$SessionAttendanceTableCreateCompanionBuilder,
      $$SessionAttendanceTableUpdateCompanionBuilder,
      (
        AttendanceRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $SessionAttendanceTable,
          AttendanceRow
        >,
      ),
      AttendanceRow,
      PrefetchHooks Function()
    >;
typedef $$MemberAssessmentsTableCreateCompanionBuilder =
    MemberAssessmentsCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> valueId,
      Value<String?> kind,
      Value<int?> score,
      Value<String?> justification,
      Value<int> rowid,
    });
typedef $$MemberAssessmentsTableUpdateCompanionBuilder =
    MemberAssessmentsCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> valueId,
      Value<String?> kind,
      Value<int?> score,
      Value<String?> justification,
      Value<int> rowid,
    });

class $$MemberAssessmentsTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $MemberAssessmentsTable> {
  $$MemberAssessmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get justification => $composableBuilder(
    column: $table.justification,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MemberAssessmentsTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $MemberAssessmentsTable> {
  $$MemberAssessmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get justification => $composableBuilder(
    column: $table.justification,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemberAssessmentsTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $MemberAssessmentsTable> {
  $$MemberAssessmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get personId =>
      $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get valueId =>
      $composableBuilder(column: $table.valueId, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get justification => $composableBuilder(
    column: $table.justification,
    builder: (column) => column,
  );
}

class $$MemberAssessmentsTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $MemberAssessmentsTable,
          AssessmentRow,
          $$MemberAssessmentsTableFilterComposer,
          $$MemberAssessmentsTableOrderingComposer,
          $$MemberAssessmentsTableAnnotationComposer,
          $$MemberAssessmentsTableCreateCompanionBuilder,
          $$MemberAssessmentsTableUpdateCompanionBuilder,
          (
            AssessmentRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $MemberAssessmentsTable,
              AssessmentRow
            >,
          ),
          AssessmentRow,
          PrefetchHooks Function()
        > {
  $$MemberAssessmentsTableTableManager(
    _$SessionDriftDatabase db,
    $MemberAssessmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemberAssessmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemberAssessmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemberAssessmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> kind = const Value.absent(),
                Value<int?> score = const Value.absent(),
                Value<String?> justification = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberAssessmentsCompanion(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                valueId: valueId,
                kind: kind,
                score: score,
                justification: justification,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> kind = const Value.absent(),
                Value<int?> score = const Value.absent(),
                Value<String?> justification = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberAssessmentsCompanion.insert(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                valueId: valueId,
                kind: kind,
                score: score,
                justification: justification,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MemberAssessmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $MemberAssessmentsTable,
      AssessmentRow,
      $$MemberAssessmentsTableFilterComposer,
      $$MemberAssessmentsTableOrderingComposer,
      $$MemberAssessmentsTableAnnotationComposer,
      $$MemberAssessmentsTableCreateCompanionBuilder,
      $$MemberAssessmentsTableUpdateCompanionBuilder,
      (
        AssessmentRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $MemberAssessmentsTable,
          AssessmentRow
        >,
      ),
      AssessmentRow,
      PrefetchHooks Function()
    >;
typedef $$MemberAnswersTableCreateCompanionBuilder =
    MemberAnswersCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> valueId,
      Value<String?> questionId,
      Value<String?> answerText,
      Value<int> rowid,
    });
typedef $$MemberAnswersTableUpdateCompanionBuilder =
    MemberAnswersCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> valueId,
      Value<String?> questionId,
      Value<String?> answerText,
      Value<int> rowid,
    });

class $$MemberAnswersTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $MemberAnswersTable> {
  $$MemberAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answerText => $composableBuilder(
    column: $table.answerText,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MemberAnswersTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $MemberAnswersTable> {
  $$MemberAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answerText => $composableBuilder(
    column: $table.answerText,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemberAnswersTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $MemberAnswersTable> {
  $$MemberAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get personId =>
      $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get valueId =>
      $composableBuilder(column: $table.valueId, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get answerText => $composableBuilder(
    column: $table.answerText,
    builder: (column) => column,
  );
}

class $$MemberAnswersTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $MemberAnswersTable,
          AnswerRow,
          $$MemberAnswersTableFilterComposer,
          $$MemberAnswersTableOrderingComposer,
          $$MemberAnswersTableAnnotationComposer,
          $$MemberAnswersTableCreateCompanionBuilder,
          $$MemberAnswersTableUpdateCompanionBuilder,
          (
            AnswerRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $MemberAnswersTable,
              AnswerRow
            >,
          ),
          AnswerRow,
          PrefetchHooks Function()
        > {
  $$MemberAnswersTableTableManager(
    _$SessionDriftDatabase db,
    $MemberAnswersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemberAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemberAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemberAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> questionId = const Value.absent(),
                Value<String?> answerText = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberAnswersCompanion(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                valueId: valueId,
                questionId: questionId,
                answerText: answerText,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> questionId = const Value.absent(),
                Value<String?> answerText = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberAnswersCompanion.insert(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                valueId: valueId,
                questionId: questionId,
                answerText: answerText,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MemberAnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $MemberAnswersTable,
      AnswerRow,
      $$MemberAnswersTableFilterComposer,
      $$MemberAnswersTableOrderingComposer,
      $$MemberAnswersTableAnnotationComposer,
      $$MemberAnswersTableCreateCompanionBuilder,
      $$MemberAnswersTableUpdateCompanionBuilder,
      (
        AnswerRow,
        BaseReferences<_$SessionDriftDatabase, $MemberAnswersTable, AnswerRow>,
      ),
      AnswerRow,
      PrefetchHooks Function()
    >;
typedef $$MemberCommitmentsTableCreateCompanionBuilder =
    MemberCommitmentsCompanion Function({
      required String id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> valueId,
      Value<String?> actionText,
      Value<String?> measureText,
      Value<String?> followUpSessionId,
      Value<String?> followUpStatus,
      Value<String?> followUpNote,
      Value<String?> followUpDeviceAt,
      Value<String?> followUpReceivedAt,
      Value<bool?> followUpSyncedLate,
      Value<int> rowid,
    });
typedef $$MemberCommitmentsTableUpdateCompanionBuilder =
    MemberCommitmentsCompanion Function({
      Value<String> id,
      Value<String?> organizationId,
      Value<String?> roundTableId,
      Value<String?> sessionId,
      Value<String?> personId,
      Value<String?> deviceCreatedAt,
      Value<String?> deviceModifiedAt,
      Value<String?> receivedAt,
      Value<bool?> syncedLate,
      Value<String?> archivedAt,
      Value<String?> createdAt,
      Value<String?> updatedAt,
      Value<String?> valueId,
      Value<String?> actionText,
      Value<String?> measureText,
      Value<String?> followUpSessionId,
      Value<String?> followUpStatus,
      Value<String?> followUpNote,
      Value<String?> followUpDeviceAt,
      Value<String?> followUpReceivedAt,
      Value<bool?> followUpSyncedLate,
      Value<int> rowid,
    });

class $$MemberCommitmentsTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $MemberCommitmentsTable> {
  $$MemberCommitmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get actionText => $composableBuilder(
    column: $table.actionText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get measureText => $composableBuilder(
    column: $table.measureText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpSessionId => $composableBuilder(
    column: $table.followUpSessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpStatus => $composableBuilder(
    column: $table.followUpStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpNote => $composableBuilder(
    column: $table.followUpNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpDeviceAt => $composableBuilder(
    column: $table.followUpDeviceAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get followUpReceivedAt => $composableBuilder(
    column: $table.followUpReceivedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get followUpSyncedLate => $composableBuilder(
    column: $table.followUpSyncedLate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MemberCommitmentsTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $MemberCommitmentsTable> {
  $$MemberCommitmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get personId => $composableBuilder(
    column: $table.personId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueId => $composableBuilder(
    column: $table.valueId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get actionText => $composableBuilder(
    column: $table.actionText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get measureText => $composableBuilder(
    column: $table.measureText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpSessionId => $composableBuilder(
    column: $table.followUpSessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpStatus => $composableBuilder(
    column: $table.followUpStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpNote => $composableBuilder(
    column: $table.followUpNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpDeviceAt => $composableBuilder(
    column: $table.followUpDeviceAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get followUpReceivedAt => $composableBuilder(
    column: $table.followUpReceivedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get followUpSyncedLate => $composableBuilder(
    column: $table.followUpSyncedLate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MemberCommitmentsTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $MemberCommitmentsTable> {
  $$MemberCommitmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get organizationId => $composableBuilder(
    column: $table.organizationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roundTableId => $composableBuilder(
    column: $table.roundTableId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get personId =>
      $composableBuilder(column: $table.personId, builder: (column) => column);

  GeneratedColumn<String> get deviceCreatedAt => $composableBuilder(
    column: $table.deviceCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get deviceModifiedAt => $composableBuilder(
    column: $table.deviceModifiedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get receivedAt => $composableBuilder(
    column: $table.receivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get syncedLate => $composableBuilder(
    column: $table.syncedLate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archivedAt => $composableBuilder(
    column: $table.archivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get valueId =>
      $composableBuilder(column: $table.valueId, builder: (column) => column);

  GeneratedColumn<String> get actionText => $composableBuilder(
    column: $table.actionText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get measureText => $composableBuilder(
    column: $table.measureText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get followUpSessionId => $composableBuilder(
    column: $table.followUpSessionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get followUpStatus => $composableBuilder(
    column: $table.followUpStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get followUpNote => $composableBuilder(
    column: $table.followUpNote,
    builder: (column) => column,
  );

  GeneratedColumn<String> get followUpDeviceAt => $composableBuilder(
    column: $table.followUpDeviceAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get followUpReceivedAt => $composableBuilder(
    column: $table.followUpReceivedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get followUpSyncedLate => $composableBuilder(
    column: $table.followUpSyncedLate,
    builder: (column) => column,
  );
}

class $$MemberCommitmentsTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $MemberCommitmentsTable,
          CommitmentRow,
          $$MemberCommitmentsTableFilterComposer,
          $$MemberCommitmentsTableOrderingComposer,
          $$MemberCommitmentsTableAnnotationComposer,
          $$MemberCommitmentsTableCreateCompanionBuilder,
          $$MemberCommitmentsTableUpdateCompanionBuilder,
          (
            CommitmentRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $MemberCommitmentsTable,
              CommitmentRow
            >,
          ),
          CommitmentRow,
          PrefetchHooks Function()
        > {
  $$MemberCommitmentsTableTableManager(
    _$SessionDriftDatabase db,
    $MemberCommitmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemberCommitmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemberCommitmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemberCommitmentsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> actionText = const Value.absent(),
                Value<String?> measureText = const Value.absent(),
                Value<String?> followUpSessionId = const Value.absent(),
                Value<String?> followUpStatus = const Value.absent(),
                Value<String?> followUpNote = const Value.absent(),
                Value<String?> followUpDeviceAt = const Value.absent(),
                Value<String?> followUpReceivedAt = const Value.absent(),
                Value<bool?> followUpSyncedLate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberCommitmentsCompanion(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                valueId: valueId,
                actionText: actionText,
                measureText: measureText,
                followUpSessionId: followUpSessionId,
                followUpStatus: followUpStatus,
                followUpNote: followUpNote,
                followUpDeviceAt: followUpDeviceAt,
                followUpReceivedAt: followUpReceivedAt,
                followUpSyncedLate: followUpSyncedLate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> organizationId = const Value.absent(),
                Value<String?> roundTableId = const Value.absent(),
                Value<String?> sessionId = const Value.absent(),
                Value<String?> personId = const Value.absent(),
                Value<String?> deviceCreatedAt = const Value.absent(),
                Value<String?> deviceModifiedAt = const Value.absent(),
                Value<String?> receivedAt = const Value.absent(),
                Value<bool?> syncedLate = const Value.absent(),
                Value<String?> archivedAt = const Value.absent(),
                Value<String?> createdAt = const Value.absent(),
                Value<String?> updatedAt = const Value.absent(),
                Value<String?> valueId = const Value.absent(),
                Value<String?> actionText = const Value.absent(),
                Value<String?> measureText = const Value.absent(),
                Value<String?> followUpSessionId = const Value.absent(),
                Value<String?> followUpStatus = const Value.absent(),
                Value<String?> followUpNote = const Value.absent(),
                Value<String?> followUpDeviceAt = const Value.absent(),
                Value<String?> followUpReceivedAt = const Value.absent(),
                Value<bool?> followUpSyncedLate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MemberCommitmentsCompanion.insert(
                id: id,
                organizationId: organizationId,
                roundTableId: roundTableId,
                sessionId: sessionId,
                personId: personId,
                deviceCreatedAt: deviceCreatedAt,
                deviceModifiedAt: deviceModifiedAt,
                receivedAt: receivedAt,
                syncedLate: syncedLate,
                archivedAt: archivedAt,
                createdAt: createdAt,
                updatedAt: updatedAt,
                valueId: valueId,
                actionText: actionText,
                measureText: measureText,
                followUpSessionId: followUpSessionId,
                followUpStatus: followUpStatus,
                followUpNote: followUpNote,
                followUpDeviceAt: followUpDeviceAt,
                followUpReceivedAt: followUpReceivedAt,
                followUpSyncedLate: followUpSyncedLate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MemberCommitmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $MemberCommitmentsTable,
      CommitmentRow,
      $$MemberCommitmentsTableFilterComposer,
      $$MemberCommitmentsTableOrderingComposer,
      $$MemberCommitmentsTableAnnotationComposer,
      $$MemberCommitmentsTableCreateCompanionBuilder,
      $$MemberCommitmentsTableUpdateCompanionBuilder,
      (
        CommitmentRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $MemberCommitmentsTable,
          CommitmentRow
        >,
      ),
      CommitmentRow,
      PrefetchHooks Function()
    >;
typedef $$SyncUploadRejectionsTableCreateCompanionBuilder =
    SyncUploadRejectionsCompanion Function({
      required String id,
      Value<String?> tableNameValue,
      Value<String?> rowId,
      Value<String?> code,
      Value<String?> message,
      Value<String?> rejectedAt,
      Value<int> rowid,
    });
typedef $$SyncUploadRejectionsTableUpdateCompanionBuilder =
    SyncUploadRejectionsCompanion Function({
      Value<String> id,
      Value<String?> tableNameValue,
      Value<String?> rowId,
      Value<String?> code,
      Value<String?> message,
      Value<String?> rejectedAt,
      Value<int> rowid,
    });

class $$SyncUploadRejectionsTableFilterComposer
    extends Composer<_$SessionDriftDatabase, $SyncUploadRejectionsTable> {
  $$SyncUploadRejectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tableNameValue => $composableBuilder(
    column: $table.tableNameValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rejectedAt => $composableBuilder(
    column: $table.rejectedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncUploadRejectionsTableOrderingComposer
    extends Composer<_$SessionDriftDatabase, $SyncUploadRejectionsTable> {
  $$SyncUploadRejectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tableNameValue => $composableBuilder(
    column: $table.tableNameValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rowId => $composableBuilder(
    column: $table.rowId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rejectedAt => $composableBuilder(
    column: $table.rejectedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncUploadRejectionsTableAnnotationComposer
    extends Composer<_$SessionDriftDatabase, $SyncUploadRejectionsTable> {
  $$SyncUploadRejectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tableNameValue => $composableBuilder(
    column: $table.tableNameValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rowId =>
      $composableBuilder(column: $table.rowId, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get rejectedAt => $composableBuilder(
    column: $table.rejectedAt,
    builder: (column) => column,
  );
}

class $$SyncUploadRejectionsTableTableManager
    extends
        RootTableManager<
          _$SessionDriftDatabase,
          $SyncUploadRejectionsTable,
          UploadRejectionRow,
          $$SyncUploadRejectionsTableFilterComposer,
          $$SyncUploadRejectionsTableOrderingComposer,
          $$SyncUploadRejectionsTableAnnotationComposer,
          $$SyncUploadRejectionsTableCreateCompanionBuilder,
          $$SyncUploadRejectionsTableUpdateCompanionBuilder,
          (
            UploadRejectionRow,
            BaseReferences<
              _$SessionDriftDatabase,
              $SyncUploadRejectionsTable,
              UploadRejectionRow
            >,
          ),
          UploadRejectionRow,
          PrefetchHooks Function()
        > {
  $$SyncUploadRejectionsTableTableManager(
    _$SessionDriftDatabase db,
    $SyncUploadRejectionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncUploadRejectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncUploadRejectionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SyncUploadRejectionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> tableNameValue = const Value.absent(),
                Value<String?> rowId = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<String?> rejectedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncUploadRejectionsCompanion(
                id: id,
                tableNameValue: tableNameValue,
                rowId: rowId,
                code: code,
                message: message,
                rejectedAt: rejectedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> tableNameValue = const Value.absent(),
                Value<String?> rowId = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> message = const Value.absent(),
                Value<String?> rejectedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncUploadRejectionsCompanion.insert(
                id: id,
                tableNameValue: tableNameValue,
                rowId: rowId,
                code: code,
                message: message,
                rejectedAt: rejectedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncUploadRejectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$SessionDriftDatabase,
      $SyncUploadRejectionsTable,
      UploadRejectionRow,
      $$SyncUploadRejectionsTableFilterComposer,
      $$SyncUploadRejectionsTableOrderingComposer,
      $$SyncUploadRejectionsTableAnnotationComposer,
      $$SyncUploadRejectionsTableCreateCompanionBuilder,
      $$SyncUploadRejectionsTableUpdateCompanionBuilder,
      (
        UploadRejectionRow,
        BaseReferences<
          _$SessionDriftDatabase,
          $SyncUploadRejectionsTable,
          UploadRejectionRow
        >,
      ),
      UploadRejectionRow,
      PrefetchHooks Function()
    >;

class $SessionDriftDatabaseManager {
  final _$SessionDriftDatabase _db;
  $SessionDriftDatabaseManager(this._db);
  $$CurriculumValuesTableTableManager get curriculumValues =>
      $$CurriculumValuesTableTableManager(_db, _db.curriculumValues);
  $$ValueQuestionsTableTableManager get valueQuestions =>
      $$ValueQuestionsTableTableManager(_db, _db.valueQuestions);
  $$OrganizationsTableTableManager get organizations =>
      $$OrganizationsTableTableManager(_db, _db.organizations);
  $$PeopleTableTableManager get people =>
      $$PeopleTableTableManager(_db, _db.people);
  $$RoundTablesTableTableManager get roundTables =>
      $$RoundTablesTableTableManager(_db, _db.roundTables);
  $$TableMembersTableTableManager get tableMembers =>
      $$TableMembersTableTableManager(_db, _db.tableMembers);
  $$SessionsTableTableManager get sessions =>
      $$SessionsTableTableManager(_db, _db.sessions);
  $$SessionAttendanceTableTableManager get sessionAttendance =>
      $$SessionAttendanceTableTableManager(_db, _db.sessionAttendance);
  $$MemberAssessmentsTableTableManager get memberAssessments =>
      $$MemberAssessmentsTableTableManager(_db, _db.memberAssessments);
  $$MemberAnswersTableTableManager get memberAnswers =>
      $$MemberAnswersTableTableManager(_db, _db.memberAnswers);
  $$MemberCommitmentsTableTableManager get memberCommitments =>
      $$MemberCommitmentsTableTableManager(_db, _db.memberCommitments);
  $$SyncUploadRejectionsTableTableManager get syncUploadRejections =>
      $$SyncUploadRejectionsTableTableManager(_db, _db.syncUploadRejections);
}
