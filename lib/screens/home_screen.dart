import 'package:flutter/material.dart';
import 'package:provider_app/models/todo_task.dart';
import 'package:provider_app/providers/todo_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/widgets/todo_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController todoFieldController = TextEditingController();
    void _addTodo(BuildContext context, String todoTask) {
      var todoModel = TodoTaskModel(todoTask, false);
      context.read<TodoProvider>().addTodo(todoModel);
      todoFieldController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App | Provider'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              child: TextField(
                controller: todoFieldController,
                decoration: InputDecoration(
                    labelText: 'Enter Todo', hintText: 'Specify Todo Task'),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10.0),
              child: MaterialButton(
                padding: EdgeInsets.all(20.0),
                onPressed: () => _addTodo(context, todoFieldController.text),
                child: Text(
                  'Add Todo'.toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ),
            TodoListWidget()
          ],
        ),
      ),
    );
  }
}
