import '/app/core/model/jsonPlaceHolder_search_query_param.dart';
import '/app/data/model/toDo_item_response.dart';

abstract class JSONPlaceholderRemoteDataSource {
  Future<List<ToDoItemResponse>> fetchJSONPlaceholderTodos(
      JsonPlaceHolderSearchQueryParam queryParam);

  Future<ToDoItemResponse> getJSONPlaceholderTodosDetails(int id);
}
