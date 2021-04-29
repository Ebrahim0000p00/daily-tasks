import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isCheck;
  final String text;
  final Function checkboxCallback;
  final Function listTileLongPress;

  TaskTile(
      {this.isCheck, this.text, this.checkboxCallback, this.listTileLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: listTileLongPress,
      title: Text(
        text,
        style: TextStyle(
          decoration: isCheck ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isCheck,
        onChanged: checkboxCallback,
      ),
    );
  }
}
