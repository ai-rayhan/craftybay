import 'package:craftybay/presentation/state_holders/categorycontroller.dart';
import 'package:craftybay/presentation/ui/widgets/category_item.dart';
import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox get categoryList {
  return SizedBox(
    height: 130,
    child: GetBuilder<CategoryController>(builder: (categoryController) {
      return Visibility(
        visible: categoryController.inProgress == false,
        replacement: const CenterCircularProgressIndicator(),
        child: ListView.separated(
          itemCount:
              categoryController.categoryListModel.categoryList?.length ?? 0,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryItem(
                category:
                    categoryController.categoryListModel.categoryList![index]);
          },
          separatorBuilder: (_, __) {
            return const SizedBox(
              width: 8,
            );
          },
        ),
      );
    }),
  );
}
