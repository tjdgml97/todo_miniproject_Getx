import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Todo {
  String content;
  int idx;
  Todo(this.content, this.idx);
}

class Controller extends GetxController {
  List<Todo> todolist = [];

  void create(String newtodo) {
    int id = todolist.length + 1;
    todolist.add(Todo(newtodo, id));
    update();
  }

  void todoupdate(String updatetodo, int index) {
    todolist[index - 1] = Todo(updatetodo, index);
    update();
  }
}
