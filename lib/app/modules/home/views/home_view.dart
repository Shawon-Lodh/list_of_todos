import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/widget/paging_view.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/widget/item_todos.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getJSONPlaceholderGetxTodosList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'List of todos',
    );
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Obx(
          () => ListView.separated(
            shrinkWrap: true,
            itemCount: controller.toDoList.length,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var model = controller.toDoList[index];
              return ItemTodos(dataModel: model);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(height: AppValues.smallMargin),
          ),
        ),
      ),
    );
  }
}
