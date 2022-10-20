import 'package:dio/dio.dart';
import 'package:list_of_todos/app/data/remote/jsonPlaceholder_remote_data_source.dart';
import '/app/core/base/base_remote_source.dart';
import '/app/core/model/jsonPlaceHolder_search_query_param.dart';
import '/app/data/model/toDo_item_response.dart';
import '/app/network/dio_provider.dart';

class JSONPlaceholderRemoteDataSourceImpl extends BaseRemoteSource
    implements JSONPlaceholderRemoteDataSource {
  @override
  Future<List<ToDoItemResponse>> fetchJSONPlaceholderTodos(
      JsonPlaceHolderSearchQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/todos";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseJSONPlaceholderProjectTodosResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ToDoItemResponse> getJSONPlaceholderTodosDetails(int id) {
    var endpoint = "${DioProvider.baseUrl}/todos/$id";
    var dioCall = dioClient.get(endpoint);

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseJSONPlaceholderTodosDetailsResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<ToDoItemResponse> _parseJSONPlaceholderProjectTodosResponse(
      Response<dynamic> response) {
      final Iterable jsonBody = response.data;
      return jsonBody.map((toDoItem) => ToDoItemResponse.fromJson(toDoItem)).toList();
  }

  ToDoItemResponse _parseJSONPlaceholderTodosDetailsResponse(Response<dynamic> response) {
    return ToDoItemResponse.fromJson(response.data);
  }
}
