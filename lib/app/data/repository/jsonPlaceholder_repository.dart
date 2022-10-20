import '/app/core/model/jsonPlaceHolder_search_query_param.dart';
import '/app/data/model/toDo_item_response.dart';

abstract class JSONPlaceholderRepository {
  Future<List<ToDoItemResponse>> fetchTodos(
      JsonPlaceHolderSearchQueryParam queryParam);

  Future<ToDoItemResponse> getTodosDetails(int id);
}
