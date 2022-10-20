import 'package:get/get.dart';
import '/app/core/model/jsonPlaceHolder_search_query_param.dart';
import '/app/data/model/toDo_item_response.dart';
import '/app/data/remote/jsonPlaceholder_remote_data_source.dart';
import '/app/data/repository/jsonPlaceholder_repository.dart';

class JSONPlaceholderRepositoryImpl implements JSONPlaceholderRepository {
  final JSONPlaceholderRemoteDataSource _remoteSource =
      Get.find(tag: (JSONPlaceholderRemoteDataSource).toString());

  @override
  Future<List<ToDoItemResponse>> fetchTodos(
      JsonPlaceHolderSearchQueryParam queryParam) {
    return _remoteSource.fetchJSONPlaceholderTodos(queryParam);
  }

  @override
  Future<ToDoItemResponse> getTodosDetails(int id) {
    return _remoteSource.getJSONPlaceholderTodosDetails(id);
  }
}
