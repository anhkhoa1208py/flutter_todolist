import 'dart:async';
import 'dart:math';

import 'package:flutter_app_todolist/base/base_bloc.dart';
import 'package:flutter_app_todolist/base/base_event.dart';
import 'package:flutter_app_todolist/event/add_todo_event.dart';
import 'package:flutter_app_todolist/event/delete_todo_event.dart';
import 'package:flutter_app_todolist/model/todo.dart';

class TodoBloc extends BaseBloc {
  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();

  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  var randomInt = Random();
  List<Todo> _todoListData = List<Todo>();

  _addTodo(Todo todo){
    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteTodo(Todo todo){
    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
    if(event is AddTodoEvent){
      Todo todo = Todo.fromData(randomInt.nextInt(1000000), event.content);
      _addTodo(todo);
    }
    else if(event is DeleteTodoEvent){
      _deleteTodo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }


}
