import '/app/core/values/app_values.dart';

class JsonPlaceHolderSearchQueryParam {
  int perPage;
  int pageNumber;

  JsonPlaceHolderSearchQueryParam({
    this.perPage = AppValues.defaultPageSize,
    this.pageNumber = AppValues.defaultPageNumber,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_limit'] = perPage;
    data['_page'] = pageNumber;

    return data;
  }
}
