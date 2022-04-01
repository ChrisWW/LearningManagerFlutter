import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Goals extends Table {
  // instead of ()() we can use .call()
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();

  TextColumn get goal => text().withLength(min: 1, max: 50)();

  TextColumn get intenseGoal => text().withLength(min: 1, max: 50)();

  TextColumn get timeGoal => text().withLength(min: 1, max: 50)();

  // color maybe int?
  TextColumn get color => text().withLength(min: 1, max: 50)();

  TextColumn get initialDate => text().withLength(min: 1, max: 50)();

  TextColumn get editDate => text().withLength(min: 1, max: 50)();

  // DateTimeColumn get initialDate => dateTime().nullable()();
  //
  // DateTimeColumn get editDate => dateTime().nullable()();

  //maybe not necessary there is no need on expanded boolean
  BoolColumn get completed => boolean().withDefault(Constant(false))();

// custom primary keys, not necessary in my case
// @override
// Set<Column> get primaryKey => {id, goal};
}

@UseMoor(tables: [Goals])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'db.sqlite', logStatements: true));

  @override
  int get schemaVersion => 2;

  Future<List<Goal>> getAllGoals() => select(goals).get();
  Stream<List<Goal>> watchAllTasks() => select(goals).watch();
  Future insertGoal(Goal goal) => into(goals).insert(goal);
  Future updateGoal(Goal goal) => update(goals).replace(goal);
  Future deleteGoal(Goal goal) => delete(goals).delete(goal);

}
