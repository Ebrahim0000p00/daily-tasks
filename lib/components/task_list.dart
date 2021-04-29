import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_tile.dart';
import 'package:todoey/models/task_Data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            //current task
            final task = taskData.tasks[index];
            return TaskTile(
              isCheck: task.isDone ?? false,
              text: task.name,
              checkboxCallback: (checkState) {
                taskData.toggleCheck(task);
              },
              listTileLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: Colors.lightBlueAccent,
                      title: Text(
                        'r U want to delete ${task.name}',
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RaisedButton(
                            child: Text('delete'),
                            onPressed: () {
                              taskData.deleteTask(task);
                              Navigator.pop(context);
                            },
                          ),
                          RaisedButton(
                            child: Text('cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
