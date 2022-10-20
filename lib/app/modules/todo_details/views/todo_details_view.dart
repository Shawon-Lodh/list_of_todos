import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_todos/app/modules/todo_details/controllers/todo_details_controller.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/custom_app_bar.dart';
import '/app/core/widget/icon_text_widgets.dart';

class ToDoDetailsView extends BaseView<ToDoDetailsController> {
  ToDoDetailsView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'ToDo details',
      isBackButtonEnabled: true,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => _getView()),
      ),
    );
  }

  Widget _getView() {
    return (controller.toDoItemData.userId == null) ? Container() : Container(
      margin: const EdgeInsets.all(AppValues.margin_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            controller.toDoItemData.title!,
            style: cardTitleStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const SizedBox(height: AppValues.margin_4),
          _getDetailsView(),
        ],
      ),
    );
  }

  Widget _getDetailsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTextWidget(
          icon: Icons.numbers,
          value: controller.toDoItemData.id.toString(),
          size: AppValues.iconSize_20,
          color: AppColors.iconColorDefault,
        ),
        IconTextWidget(
          icon: Icons.person,
          value: controller.toDoItemData.userId.toString(),
          height: AppValues.iconSize_20,
          width: AppValues.iconSize_20,
          color: AppColors.iconColorDefault,
        ),
        Checkbox(
          value: controller.toDoItemData.completed,
          onChanged: null,
        ),
      ],
    );
  }

}
