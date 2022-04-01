import 'package:flutter/material.dart';
import 'dart:math';

import 'package:learning_manager_flutter_ver1/tabs/view/tabs_view.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400]!,
                  Colors.blue[800]!,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              "https://api.uifaces.co/our-content/donated/gPZwCbdS.jpg"),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "Eren Jager",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(children: [
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200*val)
                  ..rotateY((pi/6)*val),
                  child: TabsView()
                  // Scaffold(
                  //   appBar: AppBar(
                  //     title: Text("3D Drawer Menu")
                  //   ),
                  //   body: Center(
                  //     child:
                  //     Text("Swipe to right to open the menu"),
                  //
                  //   )
                  // ),
                ));
              }),

           GestureDetector(

             onHorizontalDragUpdate: (e) {
               if(e.delta.dx > 0) {
                 setState(() {
                   value = 1;
                 });
               } else {
                 setState(() {
                   value = 0;
                 });
               }
             },

             // onTap: () {
             //   setState(() {
             //     value == 0 ? value - 1 : value = 0; // if the value is equal to 0 then when we tap it will become 1 else it become 0
             //
             //   });
             // }
           )

        ],
      ),
    );
  }
}
