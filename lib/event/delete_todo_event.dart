import 'package:flutter_app_todolist/base/base_event.dart';
import 'package:flutter_app_todolist/model/todo.dart';

class DeleteTodoEvent extends BaseEvent {
  Todo todo;

  DeleteTodoEvent(this.todo);

}