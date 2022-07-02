import 'package:flutter/material.dart';
import 'package:provider_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scrollbar(
        isAlwaysShown: true,
        child: ListView.builder(
          itemCount: context.watch<TodoProvider>().getTodoList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(context
                        .watch<TodoProvider>()
                        .getTodoList[index]
                        .todoTask
                        .toString()),
                    Checkbox(
                      value: (context
                          .watch<TodoProvider>()
                          .getTodoList[index]
                          .todoStatus),
                      onChanged: (bool? value) {
                        context
                            .read<TodoProvider>()
                            .updateTodoTask(index, value);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
