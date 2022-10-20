import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_of_todos/app/core/widget/ripple.dart';
import 'package:list_of_todos/app/data/model/toDo_item_response.dart';

import '/app/core/base/base_widget_mixin.dart';
import '/app/core/values/app_colors.dart';
import '/app/core/values/app_values.dart';
import '/app/core/values/text_styles.dart';
import '/app/core/widget/elevated_container.dart';
import '/app/core/widget/icon_text_widgets.dart';
import '/app/routes/app_pages.dart';

class ItemTodos extends StatelessWidget with BaseWidgetMixin {
  final ToDoItemResponse dataModel;

  ItemTodos({
    Key? key,
    required this.dataModel,
  }) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return ElevatedContainer(
      child: Ripple(
        onTap: _onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding),
          child: _getDetailsView(),
        ),
      ),
    );
  }

  Widget _getDetailsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dataModel.title!,
          style: cardTitleStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(height: AppValues.margin_4),
        _getToDosOthersDetailsView(),
      ],
    );
  }

  Widget _getToDosOthersDetailsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconTextWidget(
          icon: Icons.numbers,
          value: dataModel.id.toString(),
          size: AppValues.iconSize_20,
          color: AppColors.iconColorDefault,
        ),
        IconTextWidget(
          icon: Icons.person,
          value: dataModel.userId.toString(),
          height: AppValues.iconSize_20,
          width: AppValues.iconSize_20,
          color: AppColors.iconColorDefault,
        ),
        Checkbox(
          value: dataModel.completed,
          onChanged: null,
        ),
      ],
    );
  }

  void _onTap() {
    Get.toNamed(Routes.TODO_DETAILS, arguments: dataModel.id);
  }
}
