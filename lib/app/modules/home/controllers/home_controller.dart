import 'package:get/get.dart';

import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/jsonPlaceHolder_search_query_param.dart';
import '/app/data/model/toDo_item_response.dart';
import '/app/data/repository/jsonPlaceholder_repository.dart';

class HomeController extends BaseController {
  final JSONPlaceholderRepository _repository =
      Get.find(tag: (JSONPlaceholderRepository).toString());

  final RxList<ToDoItemResponse> _todosListController =
      RxList.empty();

  List<ToDoItemResponse> get toDoList =>
      _todosListController.toList();

  final pagingController = PagingController<ToDoItemResponse>();

  void getJSONPlaceholderGetxTodosList() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;

    var queryParam = JsonPlaceHolderSearchQueryParam(
      pageNumber: pagingController.pageNumber,
    );

    var toDosFetchService = _repository.fetchTodos(queryParam);

    callDataService(
      toDosFetchService,
      onSuccess: _handleTodoListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getJSONPlaceholderGetxTodosList();
  }

  onLoadNextPage() {
    logger.i("On load next");

    getJSONPlaceholderGetxTodosList();
  }

  void _handleTodoListResponseSuccess(List<ToDoItemResponse> response) {
    if (_isLastPage(response.length, 200)) {
      pagingController.appendLastPage(response);
    } else {
      pagingController.appendPage(response);
    }

    var newList = [...pagingController.listItems];

    _todosListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (toDoList.length + newListItemCount) >= totalCount;
  }
}
