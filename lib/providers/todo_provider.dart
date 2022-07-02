import 'package:flutter/material.dart';
import 'package:provider_app/models/todo_task.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoTaskModel> _todoList = [];

  List<TodoTaskModel> get getTodoList => _todoList;

  void addTodo(TodoTaskModel model) {
    _todoList.add(model);
    notifyListeners();
  }

  void updateTodoTask(int index, bool? value) {
    _todoList[index].todoStatus = value;
    _todoList.removeAt(index);
    notifyListeners();
  }
}
