import 'package:flutter/material.dart';
import 'package:flutter_app_todolist/bloc/todo_bloc.dart';
import 'package:flutter_app_todolist/todo/todo_list_container.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: TodoListContainer()),
      ),
    );
  }
}
