import 'package:get/get.dart';
import 'package:list_of_todos/app/data/repository/jsonPlaceholder_repository.dart';
import '/app/core/base/base_controller.dart';
import '/app/data/model/toDo_item_response.dart';

class ToDoDetailsController extends BaseController {
  final JSONPlaceholderRepository _repository =
      Get.find(tag: (JSONPlaceholderRepository).toString());

  final Rx<ToDoItemResponse> _toDoItemData = ToDoItemResponse().obs;

  ToDoItemResponse get toDoItemData => _toDoItemData.value;

  @override
  void onInit() {
    int id = Get.arguments;
    getToDoDetails(id);
    super.onInit();
  }

  void getToDoDetails(int id) {
    callDataService(
      _repository.getTodosDetails(id),
      onSuccess: _handleToDoDetailsResponseSuccess,
    );
  }

  void _handleToDoDetailsResponseSuccess(ToDoItemResponse toDoItem) {
    _toDoItemData(toDoItem);
  }
}
