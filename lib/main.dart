import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_Data.dart';
import 'package:todoey/screens/tasks_screen.dart';

main() => runApp(Todoey());

class Todoey extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
