import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:axehero/main.dart';
import 'package:axehero/controllers/todo_controller.dart';
import 'package:axehero/ui/edit_todo.dart';
import 'package:axehero/ui/todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed(TodoScreen.id);
        },
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  todoController.todos[index].text!,
                  style: todoController.todos[index].done
                      ? const TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        )
                      : const TextStyle(
                          color: Colors.black,
                        ),
                ),
                trailing: Text(
                  '10 хүн санал өгсөн',
                  style: TextStyle(color: Colors.green),
                ),
                leading: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (neWvalue) {
                    var todo = todoController.todos[index];
                    todo.done = neWvalue!;
                    todoController.todos[index] = todo;
                  },
                ),
              );
            }

            // background: Container(
            //   color: Colors.deepOrange,
            //   child: const Icon(
            //     Icons.delete,
            //     color: Colors.white,
            //   ),
            // ),
            // onDismissed: (_) {
            //   todoController.todos.removeAt(index);
            //   Get.snackbar('Remove!', "Task was succesfully Delete",
            //       snackPosition: SnackPosition.BOTTOM);
            // },

            ),
      ),
    );
  }
}
