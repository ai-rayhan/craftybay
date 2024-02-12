import 'package:craftybay/data/models/product_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();
  ProductListModel get productListModel => _productListModel;

  Future<bool> getProductList({required int categoryId}) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(
      Urls.productsByCategory(categoryId),
    );

    _inProgress = false;
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
