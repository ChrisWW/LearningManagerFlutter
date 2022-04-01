import 'package:flutter/material.dart';

class GoalFormWidget extends StatelessWidget {
  final bool? isImportant;
  final String? timeGoal;
  final String? title;
  final String? minutesPerDay;
  final String? daysForGoal;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedMinutesPerDay;
  final ValueChanged<String> onChangedDaysForGoal;


  //isImportant is not necessary here only title, description what is number here, IMO not necessary
  const GoalFormWidget({
    Key? key,
    this.isImportant = false,
    this.timeGoal = '',
    this.title = '',
    this.minutesPerDay = '',
    this.daysForGoal = '',
    required this.onChangedImportant,
    required this.onChangedTitle,
    required this.onChangedMinutesPerDay,
    required this.onChangedDaysForGoal
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [

            ],
          ),
          buildTitle(),
          SizedBox(height: 16),
          buildTimePerDay(),
          SizedBox(height: 16),
          buildQuantityOfGoal(),
          SizedBox(height: 16,)
        ],
      ),
    ),
  );

  Widget buildTitle() => TextFormField(
    maxLines: 1,
    initialValue: title,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'Goal',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) =>
    title != null && title.isEmpty ? 'The title cannot be empty' : null,
    onChanged: onChangedTitle,
  );

  Widget buildTimePerDay() => TextFormField(
    maxLines: 1,
    initialValue: minutesPerDay,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'How many minutes per day?',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The description cannot be empty'
        : null,
    onChanged: onChangedMinutesPerDay,
  );

  Widget buildQuantityOfGoal() => TextFormField(
    maxLines: 1,
    initialValue: daysForGoal,
    style: TextStyle(color: Colors.black, fontSize: 18),
    decoration: InputDecoration(
      border: InputBorder.none,
      hintText: 'How many days for your goal?',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (title) => title != null && title.isEmpty
        ? 'The description cannot be empty'
        : null,
    onChanged: onChangedDaysForGoal,
  );
}
