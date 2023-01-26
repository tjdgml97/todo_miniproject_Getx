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
  TextEditingController updateController = TextEditingController();
  String updatetodo = '';
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
                              inputController.clear();
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

//                     ListTile(
//   title: Text("This is my ListTile"),
//   trailing: Wrap(
//     spacing: 12, // space between two icons
//     children: <Widget>[
//       Icon(Icons.call), // icon-1
//       Icon(Icons.message), // icon-2
//     ],
//   ),
// )

                    trailing: Wrap(
                      spacing: 10,
                      children: [
                        IconButton(
                          icon: Icon(Icons.create),
                          onPressed: () {
                            print("hi");
                            //print(i);
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: TextField(
                                      controller: updateController,
                                      // obscureText: true,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: i.toString(),
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text("저장"),
                                        onPressed: () {
                                          updatetodo =
                                              updateController.text.toString();
                                          controller.todoupdate(updatetodo, i);
                                          updatetodo = '';
                                          updateController.clear();
                                          Navigator.pop(context);
                                        },
                                      ),
                                      TextButton(
                                        child: Text("취소"),
                                        onPressed: () {},
                                      ),
                                    ],
                                  );
                                });
                          },
                        ),
                        // IconButton(
                        //   icon: Icon(Icons.delete),
                        //   onPressed: () {},
                        // ),
                      ],
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
