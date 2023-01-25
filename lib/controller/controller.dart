import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Todo {
  String content;

  Todo(this.content);
}

class Controller extends GetxController {
  List<Todo> todolist = [];

  void create(String newtodo) {
    todolist.add(Todo(newtodo));
    update();
  }
}
