import 'package:get/get.dart';

import '/app/data/remote/jsonPlaceholder_remote_data_source.dart';
import '/app/data/remote/jsonPlaceholder_remote_data_source_impl.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JSONPlaceholderRemoteDataSource>(
      () => JSONPlaceholderRemoteDataSourceImpl(),
      tag: (JSONPlaceholderRemoteDataSource).toString(),
    );
  }
}
