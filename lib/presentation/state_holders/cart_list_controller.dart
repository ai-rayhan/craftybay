import 'package:craftybay/data/models/cart_item.dart';
import 'package:craftybay/data/models/cart_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  CartListModel _cartListModel = CartListModel();

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  CartListModel get cartListModel => _cartListModel;

  final RxDouble _totalPrice = 0.0.obs;
  RxDouble get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.cartList);
    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseData);
      _totalPrice.value = calculateTotalPrice();
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> deleteCartItem(int productIdx) async {
    bool isSuccess = false;
    _inProgress = true;

    update();
    final response =
        await NetworkCaller().getRequest(Urls.deleteCartItem(productIdx));
    if (response.isSuccess) {
      //_cartListModel = CartListModel.fromJson(response.responseData);
      _cartListModel.cartItemList
          ?.removeWhere((element) => element.productId == productIdx);
      calculateTotalPrice();
      update();
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  void updateQuantity(int id, int quantity) {
    _cartListModel.cartItemList
        ?.firstWhere((element) => element.id == id)
        .quantity = quantity;
    _totalPrice.value = calculateTotalPrice();
  }

  double calculateTotalPrice() {
    double total = 0;
    for (CartItem item in _cartListModel.cartItemList ?? []) {
      total +=
          (double.tryParse(item.product?.price ?? '') ?? 0) * item.quantity;
    }
    return total;
  }
}
