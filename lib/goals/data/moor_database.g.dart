// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Goal extends DataClass implements Insertable<Goal> {
  final int id;
  final String goal;
  final String intenseGoal;
  final String timeGoal;
  final String color;
  final String initialDate;
  final String editDate;
  final bool completed;
  Goal(
      {required this.id,
      required this.goal,
      required this.intenseGoal,
      required this.timeGoal,
      required this.color,
      required this.initialDate,
      required this.editDate,
      required this.completed});
  factory Goal.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Goal(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      goal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}goal'])!,
      intenseGoal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}intense_goal'])!,
      timeGoal: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_goal'])!,
      color: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}color'])!,
      initialDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}initial_date'])!,
      editDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}edit_date'])!,
      completed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completed'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['goal'] = Variable<String>(goal);
    map['intense_goal'] = Variable<String>(intenseGoal);
    map['time_goal'] = Variable<String>(timeGoal);
    map['color'] = Variable<String>(color);
    map['initial_date'] = Variable<String>(initialDate);
    map['edit_date'] = Variable<String>(editDate);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      id: Value(id),
      goal: Value(goal),
      intenseGoal: Value(intenseGoal),
      timeGoal: Value(timeGoal),
      color: Value(color),
      initialDate: Value(initialDate),
      editDate: Value(editDate),
      completed: Value(completed),
    );
  }

  factory Goal.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Goal(
      id: serializer.fromJson<int>(json['id']),
      goal: serializer.fromJson<String>(json['goal']),
      intenseGoal: serializer.fromJson<String>(json['intenseGoal']),
      timeGoal: serializer.fromJson<String>(json['timeGoal']),
      color: serializer.fromJson<String>(json['color']),
      initialDate: serializer.fromJson<String>(json['initialDate']),
      editDate: serializer.fromJson<String>(json['editDate']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'goal': serializer.toJson<String>(goal),
      'intenseGoal': serializer.toJson<String>(intenseGoal),
      'timeGoal': serializer.toJson<String>(timeGoal),
      'color': serializer.toJson<String>(color),
      'initialDate': serializer.toJson<String>(initialDate),
      'editDate': serializer.toJson<String>(editDate),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  Goal copyWith(
          {int? id,
          String? goal,
          String? intenseGoal,
          String? timeGoal,
          String? color,
          String? initialDate,
          String? editDate,
          bool? completed}) =>
      Goal(
        id: id ?? this.id,
        goal: goal ?? this.goal,
        intenseGoal: intenseGoal ?? this.intenseGoal,
        timeGoal: timeGoal ?? this.timeGoal,
        color: color ?? this.color,
        initialDate: initialDate ?? this.initialDate,
        editDate: editDate ?? this.editDate,
        completed: completed ?? this.completed,
      );
  @override
  String toString() {
    return (StringBuffer('Goal(')
          ..write('id: $id, ')
          ..write('goal: $goal, ')
          ..write('intenseGoal: $intenseGoal, ')
          ..write('timeGoal: $timeGoal, ')
          ..write('color: $color, ')
          ..write('initialDate: $initialDate, ')
          ..write('editDate: $editDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, goal, intenseGoal, timeGoal, color, initialDate, editDate, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Goal &&
          other.id == this.id &&
          other.goal == this.goal &&
          other.intenseGoal == this.intenseGoal &&
          other.timeGoal == this.timeGoal &&
          other.color == this.color &&
          other.initialDate == this.initialDate &&
          other.editDate == this.editDate &&
          other.completed == this.completed);
}

class GoalsCompanion extends UpdateCompanion<Goal> {
  final Value<int> id;
  final Value<String> goal;
  final Value<String> intenseGoal;
  final Value<String> timeGoal;
  final Value<String> color;
  final Value<String> initialDate;
  final Value<String> editDate;
  final Value<bool> completed;
  const GoalsCompanion({
    this.id = const Value.absent(),
    this.goal = const Value.absent(),
    this.intenseGoal = const Value.absent(),
    this.timeGoal = const Value.absent(),
    this.color = const Value.absent(),
    this.initialDate = const Value.absent(),
    this.editDate = const Value.absent(),
    this.completed = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.id = const Value.absent(),
    required String goal,
    required String intenseGoal,
    required String timeGoal,
    required String color,
    required String initialDate,
    required String editDate,
    this.completed = const Value.absent(),
  })  : goal = Value(goal),
        intenseGoal = Value(intenseGoal),
        timeGoal = Value(timeGoal),
        color = Value(color),
        initialDate = Value(initialDate),
        editDate = Value(editDate);
  static Insertable<Goal> custom({
    Expression<int>? id,
    Expression<String>? goal,
    Expression<String>? intenseGoal,
    Expression<String>? timeGoal,
    Expression<String>? color,
    Expression<String>? initialDate,
    Expression<String>? editDate,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (goal != null) 'goal': goal,
      if (intenseGoal != null) 'intense_goal': intenseGoal,
      if (timeGoal != null) 'time_goal': timeGoal,
      if (color != null) 'color': color,
      if (initialDate != null) 'initial_date': initialDate,
      if (editDate != null) 'edit_date': editDate,
      if (completed != null) 'completed': completed,
    });
  }

  GoalsCompanion copyWith(
      {Value<int>? id,
      Value<String>? goal,
      Value<String>? intenseGoal,
      Value<String>? timeGoal,
      Value<String>? color,
      Value<String>? initialDate,
      Value<String>? editDate,
      Value<bool>? completed}) {
    return GoalsCompanion(
      id: id ?? this.id,
      goal: goal ?? this.goal,
      intenseGoal: intenseGoal ?? this.intenseGoal,
      timeGoal: timeGoal ?? this.timeGoal,
      color: color ?? this.color,
      initialDate: initialDate ?? this.initialDate,
      editDate: editDate ?? this.editDate,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (goal.present) {
      map['goal'] = Variable<String>(goal.value);
    }
    if (intenseGoal.present) {
      map['intense_goal'] = Variable<String>(intenseGoal.value);
    }
    if (timeGoal.present) {
      map['time_goal'] = Variable<String>(timeGoal.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (initialDate.present) {
      map['initial_date'] = Variable<String>(initialDate.value);
    }
    if (editDate.present) {
      map['edit_date'] = Variable<String>(editDate.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('id: $id, ')
          ..write('goal: $goal, ')
          ..write('intenseGoal: $intenseGoal, ')
          ..write('timeGoal: $timeGoal, ')
          ..write('color: $color, ')
          ..write('initialDate: $initialDate, ')
          ..write('editDate: $editDate, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, Goal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _goalMeta = const VerificationMeta('goal');
  @override
  late final GeneratedColumn<String?> goal = GeneratedColumn<String?>(
      'goal', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _intenseGoalMeta =
      const VerificationMeta('intenseGoal');
  @override
  late final GeneratedColumn<String?> intenseGoal = GeneratedColumn<String?>(
      'intense_goal', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _timeGoalMeta = const VerificationMeta('timeGoal');
  @override
  late final GeneratedColumn<String?> timeGoal = GeneratedColumn<String?>(
      'time_goal', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String?> color = GeneratedColumn<String?>(
      'color', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _initialDateMeta =
      const VerificationMeta('initialDate');
  @override
  late final GeneratedColumn<String?> initialDate = GeneratedColumn<String?>(
      'initial_date', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _editDateMeta = const VerificationMeta('editDate');
  @override
  late final GeneratedColumn<String?> editDate = GeneratedColumn<String?>(
      'edit_date', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool?> completed = GeneratedColumn<bool?>(
      'completed', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (completed IN (0, 1))',
      defaultValue: Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        goal,
        intenseGoal,
        timeGoal,
        color,
        initialDate,
        editDate,
        completed
      ];
  @override
  String get aliasedName => _alias ?? 'goals';
  @override
  String get actualTableName => 'goals';
  @override
  VerificationContext validateIntegrity(Insertable<Goal> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('goal')) {
      context.handle(
          _goalMeta, goal.isAcceptableOrUnknown(data['goal']!, _goalMeta));
    } else if (isInserting) {
      context.missing(_goalMeta);
    }
    if (data.containsKey('intense_goal')) {
      context.handle(
          _intenseGoalMeta,
          intenseGoal.isAcceptableOrUnknown(
              data['intense_goal']!, _intenseGoalMeta));
    } else if (isInserting) {
      context.missing(_intenseGoalMeta);
    }
    if (data.containsKey('time_goal')) {
      context.handle(_timeGoalMeta,
          timeGoal.isAcceptableOrUnknown(data['time_goal']!, _timeGoalMeta));
    } else if (isInserting) {
      context.missing(_timeGoalMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('initial_date')) {
      context.handle(
          _initialDateMeta,
          initialDate.isAcceptableOrUnknown(
              data['initial_date']!, _initialDateMeta));
    } else if (isInserting) {
      context.missing(_initialDateMeta);
    }
    if (data.containsKey('edit_date')) {
      context.handle(_editDateMeta,
          editDate.isAcceptableOrUnknown(data['edit_date']!, _editDateMeta));
    } else if (isInserting) {
      context.missing(_editDateMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Goal map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Goal.fromData(data, attachedDatabase,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $GoalsTable goals = $GoalsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [goals];
}
