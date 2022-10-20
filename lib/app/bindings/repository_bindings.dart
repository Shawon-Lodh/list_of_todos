import 'package:get/get.dart';

import '/app/data/repository/jsonPlaceholder_repository.dart';
import '/app/data/repository/jsonPlaceholder_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JSONPlaceholderRepository>(
      () => JSONPlaceholderRepositoryImpl(),
      tag: (JSONPlaceholderRepository).toString(),
    );
  }
}
