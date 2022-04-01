import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_manager_flutter_ver1/goals/view/goals_view.dart';
import 'package:learning_manager_flutter_ver1/notes/page/notes_page.dart';

import '../../quotes/view/inspiration_view.dart';


class TabsView extends StatefulWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  _TabsViewState createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text("Learning Manager"),
          actions: [
            // IconButton(
            //     icon: Icon(Icons.notifications_none),
            //     color: AppColors.PRIMARY_COLOR,
            //     onPressed: () {
            //       print("Go to Notification center");
            //     }),

            // ???git
            IconButton(
              icon: Icon(Icons.archive),
              color: Colors.orange,
              onPressed: () {
                print("Go to Favourites");
              },
            ),
            IconButton(
              color: Colors.orange,
              icon: Icon(Icons.settings),
              onPressed: () {
                print("Go to Profle");
              },
            )
          ],
          backgroundColor: Colors.white,
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Colors.purple, Colors.red],
          //       begin: Alignment.bottomRight,
          //       end: Alignment.topLeft,
          //     ),
          //   ),
          // ),

          bottom: TabBar(
            //isScrollable: true,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorWeight: 5,
            tabs: [
              Tab(text: 'Inspiration'),
              Tab(text: 'Notes'),
              Tab(text: 'Goals'),
            ],
          ),
          elevation: 20,
          titleSpacing: 20,
          automaticallyImplyLeading: false),
      body: TabBarView(
        children: [
          InspirationView(),
          NotesPage(),
          GoalsView(),
        ],
      ),
    ),
  );

  Widget buildPage(String text) => Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 28),
    ),
  );
}
