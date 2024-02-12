/*import 'package:craftybay/data/models/product_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PopularProductController extends GetxController {
  bool _newProductinProgress = false;
  bool _popularProductinProgress = false;
  bool _specialProductinProgress = false;
  bool get newProductinProgress => _newProductinProgress;
  bool get popularProductinProgress => _popularProductinProgress;
  bool get specialProductinProgress => _specialProductinProgress;
  

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  ProductListModel _newProductListModel = ProductListModel();
  ProductListModel _popularProductListModel = ProductListModel();
  ProductListModel _specialProductListModel = ProductListModel();
  ProductListModel get newproductListModel => _newProductListModel;
  ProductListModel get popularProductListModel => _popularProductListModel;
  ProductListModel get specialProductListModel => _specialProductListModel;

  Future<bool> getProductListByRemarks(String remarks) async {
    bool isSuccess = false;
    if (remarks == 'New') {
      _newProductinProgress = true;
    } else if (remarks == 'Popular') {
      _popularProductinProgress = true;
    } else {
      _specialProductinProgress = true;
    }

    update();

    final response = await NetworkCaller().getRequest(
      Urls.popularProduct,
    );
    if (remarks == 'New') {
      _newProductinProgress = false;
    } else if (remarks == 'Popular') {
      _popularProductinProgress = false;
    } else {
      _specialProductinProgress = false;
    }

    if (response.isSuccess) {
      if (remarks == 'New') {
        _newProductListModel = ProductListModel.fromJson(response.responseData);
      } else if (remarks == 'Popular') {
        _popularProductListModel =
            ProductListModel.fromJson(response.responseData);
      } else {
        _specialProductListModel =
            ProductListModel.fromJson(response.responseData);
      }
      isSuccess = true;
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}*/

import 'package:craftybay/data/models/product_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PopularProductController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();
  ProductListModel get productListModel => _productListModel;

  Future<bool> getPopularProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(
      Urls.popularProduct,
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
