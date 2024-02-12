import 'package:craftybay/data/models/review_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReviewListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  ReviewListModel _reviewListModel = ReviewListModel();
  ReviewListModel get reviewListModel => _reviewListModel;

  Future<bool> getReviewList(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(
      Urls.reviewItemList+"/"+productId,
    );

    _inProgress = false;
    if (response.isSuccess) {
      _reviewListModel = ReviewListModel.fromJson(response.responseData);
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
