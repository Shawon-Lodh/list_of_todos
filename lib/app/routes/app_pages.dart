import 'package:get/get.dart';
import 'package:list_of_todos/app/modules/todo_details/bindings/todo_details_binding.dart';
import 'package:list_of_todos/app/modules/todo_details/views/todo_details_view.dart';
import '/app/modules/home/bindings/home_binding.dart';
import '/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TODO_DETAILS,
      page: () => ToDoDetailsView(),
      binding: ToDoDetailsBinding(),
    ),
  ];
}
