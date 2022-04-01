import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:learning_manager_flutter_ver1/goals/data/moor_database.dart';
import 'package:learning_manager_flutter_ver1/goals/page/edit_goal_page.dart';

class GoalsView extends StatefulWidget {
  @override
  _GoalsViewState createState() => _GoalsViewState();
}

class _GoalsViewState extends State<GoalsView> {
  bool isLoading = false;
  //

  static const loremIpsum = 'Lorem ipsum adsasds, sdadsad adalfaslf sals'
      'fasdasdsad';

  // final List<Goal> items1 = [
  // Goal(
  // id: 0,
  // goal: title,
  // timeGoal: minutesPerDay,
  // color: '',
  // intenseGoal: daysForGoal,
  // completed: isImportant);
  // ];


  final List<Item> items = [
    Item(header: 'Panel 1', body: loremIpsum),
    Item(header: 'Panel 2', body: loremIpsum),
    Item(header: 'Panel 3', body: loremIpsum),
    Item(header: 'Panel 4', body: loremIpsum),
    Item(header: 'Panel 5', body: loremIpsum),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future refreshNotes() async {
    setState(() => isLoading = true);

    // this.notes = await NotesDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }



  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: SingleChildScrollView(
          child: ExpansionPanelList(
            expansionCallback: (index, isExpanded) {
              setState(() => items[index].isExpanded = !isExpanded);
            },
            children: items
                .map((item) =>
                ExpansionPanel(
                  canTapOnHeader: true,
                  isExpanded: item.isExpanded,
                  headerBuilder: (context, isExpanded) => ListTile(
                      title: Text(
                        item.header,
                        style: TextStyle(fontSize: 20),
                      )
                  ),
                  body: ListTile(
                      title: Text(item.body, style: TextStyle(fontSize: 16 ))
                  ),
                )).toList(),

              // body: Column(
              //     children: <Widget>[
              // Expanded(child: _buildTaskList(context)),]

                // .map((item) =>
                // ExpansionPanel(
                //   canTapOnHeader: true,
                //   isExpanded: item.isExpanded,
                //   headerBuilder: (context, isExpanded) => ListTile(
                //     title: Text(
                //       item.header,
                //       style: TextStyle(fontSize: 20),
                //     )
                //   ),
                //   body: ListTile(
                //     title: Text(item.body, style: TextStyle(fontSize: 16 ))
                //   ),
                // )).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddEditGoalPage()),
            );

            refreshNotes();
          },
        ),
      );
}
//expanded zrobic

StreamBuilder<List<Goal>> _buildGoalList(BuildContext context) {
  final database = Provider.of<AppDatabase>(context);
  return StreamBuilder(
    stream: database.watchAllTasks(),
    builder: (context, AsyncSnapshot<List<Goal>> snapshot) {
      final goals = snapshot.data ?? [];
      // or List()

      return ListView.builder(
        itemCount: goals.length,
        itemBuilder: (_, index) {
          final itemGoal = goals[index];
          return _buildListItem(itemGoal, database);
        },
      );
    },
  );
}

Widget _buildListItem(Goal itemGoal, AppDatabase database) {
  return Slidable(
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: <Widget>[
        SlidableAction(
          label: 'Delete',
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          icon: Icons.delete,
          onPressed: callbackFunction(database, itemGoal),
          // onPressed: () => database.deleteGoal(itemGoal),
        ),
      ],

    ),



    // endActionPane: SlidableDrawerActionPane(),
    // secondaryActions: <Widget>[
    //   IconSlideAction(
    //     caption: 'Delete',
    //     color: Colors.red,
    //     icon: Icons.delete,
    //     onTap: () => database.deleteGoal(itemGoal),
    //   )
    // ],
    child: CheckboxListTile(
      title: Text(itemGoal.goal),
      subtitle: Text(itemGoal.editDate.toString() ?? 'No date'),
      value: itemGoal.completed,
      onChanged: (newValue) {
        database.updateGoal(itemGoal.copyWith(completed: newValue));
      },
    ),
  );
}


class Item {
  final String header;
  final String body;
  bool isExpanded;

  Item({
    required this.header,
    required this.body,
    this.isExpanded = false,
  });
}



callbackFunction(AppDatabase database, Goal itemGoal) {
  database.deleteGoal(itemGoal);
}
