import 'package:flutter/material.dart';
import 'package:learning_manager_flutter_ver1/notes/page/notes_page.dart';
import 'package:learning_manager_flutter_ver1/tabs/view/tabs_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabsView(),
    );
  }
}
