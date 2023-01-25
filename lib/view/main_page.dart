import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controller/controller.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController inputController = TextEditingController();
  String newtodo = '';
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: Center(
        child: GetBuilder<Controller>(builder: (context) {
          return ListView.builder(
              itemCount: controller.todolist.length + 1,
              itemBuilder: (context, i) {
                if (i == 0)
                  return Container(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Flexible(
                          child: TextField(
                            controller: inputController,
                            // obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: '할일을 입력하세요',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {
                              newtodo = inputController.text.toString();
                              controller.create(newtodo);
                            },
                            child: Text("추가")),
                      ],
                    ),
                  );
                else
                  return ListTile(
                    title: GetBuilder<Controller>(builder: (_) {
                      return Text(controller.todolist[i - 1].content);
                    }),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {},
                    ),
                    leading: IconButton(
                        icon: Icon(Icons.check_box_outline_blank),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text("완료하시겠습니까?"),
                                  actions: [
                                    TextButton(
                                      child: Text("네"),
                                      onPressed: () {},
                                    ),
                                    TextButton(
                                      child: Text("아니오"),
                                      onPressed: () {},
                                    ),
                                  ],
                                );
                              });
                        }),
                  );
              });
        }),
      ),
    );
  }
}
