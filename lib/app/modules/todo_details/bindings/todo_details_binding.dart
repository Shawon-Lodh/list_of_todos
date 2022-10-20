import 'package:get/get.dart';
import 'package:list_of_todos/app/modules/todo_details/controllers/todo_details_controller.dart';

class ToDoDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToDoDetailsController>(
      () => ToDoDetailsController(),
    );
  }
}
