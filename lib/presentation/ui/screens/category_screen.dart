import 'package:craftybay/presentation/state_holders/categorycontroller.dart';
import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/ui/widgets/category_item.dart';
import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Category',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          elevation: 1,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child:
                GetBuilder<CategoryController>(builder: (categoryController) {
              return Visibility(
                visible: categoryController.inProgress == false,
                replacement: const CenterCircularProgressIndicator(),
                child: GridView.builder(
                    itemCount: categoryController
                            .categoryListModel.categoryList?.length ??
                        0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.95,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 12,
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return FittedBox(
                          child: CategoryItem(
                        category: categoryController
                            .categoryListModel.categoryList![index],
                      ));
                    }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
