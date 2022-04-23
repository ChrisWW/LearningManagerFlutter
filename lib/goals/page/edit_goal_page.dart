import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_manager_flutter_ver1/goals/data/moor_database.dart';
import 'package:learning_manager_flutter_ver1/notes/model/note.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

import '../widget/goal_form_widget.dart';

class AddEditGoalPage extends StatefulWidget {
  final Goal? goal;

  const AddEditGoalPage({
    Key? key,
    this.goal
  }) : super(key: key);

  @override
  _AddEditGoalPageState createState() => _AddEditGoalPageState();
}

// TO EDIT values
class _AddEditGoalPageState extends State<AddEditGoalPage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late String timeGoal;
  late String title;
  late String minutesPerDay;
  late String color;
  late String initialDate;
  late String editDate;

  get database => AppDatabase;


  @override
  void initState() {
    super.initState();
// to check
    isImportant = widget.goal?.completed ?? false;
    timeGoal = widget.goal?.timeGoal ?? '';
    title = widget.goal?.goal ?? '';
    minutesPerDay = widget.goal?.intenseGoal ?? '';
    color = widget.goal?.color ?? '';
    initialDate = widget.goal?.initialDate ?? '';
    editDate = widget.goal?.editDate ?? '';

  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AppDatabase(),
      child: Scaffold(
        appBar: AppBar(
          actions: [buildButton()],
        ),
        body: Form(
          key: _formKey,
          child: GoalFormWidget(
            isImportant: isImportant,
            timeGoal: timeGoal,
            title: title,
            minutesPerDay: minutesPerDay,
            onChangedImportant: (isImportant) =>
                setState(() => this.isImportant = isImportant),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedMinutesPerDay: (minutesPerDay) =>
                setState(() => this.minutesPerDay = minutesPerDay),
            onChangedDaysForGoal: (timeGoal) =>
                setState(() => this.timeGoal = timeGoal),
          ),
        ),
      )

    );
}

  // Expanded _addOrUpdateGoal(BuildContext context) {
  //   return Expanded(
  //     child: TextField(
  //       decoration: InputDecoration(hintText: 'Task Name'),
  //       onSubmitted: (inputName) {
  //         // final dateFormatter = DateFormat('MMMM dd h:mm a');
  //         final database = Provider.of<AppDatabase>(context);
  //         final goal = Goal(
  //           id: 0,
  //           goal: timeGoal,
  //           intenseGoal: minutesPerDay,
  //           timeGoal: daysForGoal,
  //           initialDate: initialDate,
  //           editDate: editDate,
  //           completed: isImportant,
  //           color: color,
  //         );
  //         database.insertGoal(goal);
  //         // resetValuesAfterSubmit();
  //       },
  //     ),
  //   );
  // }

  void addOrUpdateGoal() async {

      final isUpdating = widget.goal != null;

      if (isUpdating) {
        await updateGoal();
        log('update value');
      } else {
        await addGoal();
        log('add value');
      }
    Navigator.of(context).pop();

    //doesnt work
    // final isValid = _formKey.currentState!.validate();
    //
    // if (isValid) {
    //   final isUpdating = widget.goal != null;
    //
    //   if (isUpdating) {
    //     await updateGoal();
    //   } else {
    //     await addGoal();
    //   }
    //
    //   Navigator.of(context).pop();
    // }
    // Navigator.of(context).pop();




  }

  Future addGoal() async {
    final database = Provider.of<AppDatabase>(context, listen: false);
    final goal = Goal(
      id: 0,
      goal: timeGoal,
      intenseGoal: minutesPerDay,
      timeGoal: timeGoal,
      initialDate: initialDate,
      editDate: editDate,
      completed: isImportant,
      color: color,
    );
    database.insertGoal(goal);
  }

  Future updateGoal() async {
    // final database = Provider.of<AppDatabase>(context);
    //
    // final goal = Goal(
    //   id: 0,
    //   goal: timeGoal,
    //   intenseGoal: minutesPerDay,
    //   timeGoal: daysForGoal,
    //   initialDate: initialDate,
    //   editDate: editDate,
    //   completed: isImportant,
    //   color: color,
    // );
    //
    // await database.update(goal);

    // final note = widget.goal!.copy(
    //   isImportant: isImportant,
    //   number: number,
    //   title: title,
    //   description: minutesPerDay,
    // );

    // await NotesDatabase.instance.update(note);
  }


  // ok?
  Future deleteGoal() async {
    final goal = Goal(
        id: 0,
        goal: title,
        timeGoal: timeGoal,
        color: '',
        intenseGoal: minutesPerDay,
        editDate: '',
        initialDate: '',
        completed: isImportant);
    await database.deleteGoal(goal);

  }

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && minutesPerDay.isNotEmpty && timeGoal.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateGoal,
        child: Text('Save'),
      ),
    );
  }


  // void resetValuesAfterSubmit() {
  //   setState(() {
  //     newTaskDate = null;
  //     controller.clear();
  //   });
  // }
}



        // final note = Note(
        //   title: title,
        //   isImportant: true,
        //   number: number,
        //   description: minutesPerDay,
        //   createdTime: DateTime.now(),
        // );

        // await NotesDatabase.instance.create(note);

