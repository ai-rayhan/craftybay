import 'package:craftybay/data/models/create_profile_params.dart';
import 'package:craftybay/presentation/state_holders/complete_profile_controller.dart';
import 'package:craftybay/presentation/state_holders/verify_otp_controller.dart';
import 'package:craftybay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/presentation/ui/widgets/app_logo.dart';
import 'package:craftybay/presentation/ui/widgets/center_circularprogressindicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _customerNameTEController =
      TextEditingController();
  final TextEditingController _customerAddressTEController =
      TextEditingController();
  final TextEditingController _customerCityTEController =
      TextEditingController();
  final TextEditingController _customerStateTEController =
      TextEditingController();
  final TextEditingController _customerPostCodeTEController =
      TextEditingController();
  final TextEditingController _customerCountryTEController =
      TextEditingController();
  final TextEditingController _customerPhoneTEController =
      TextEditingController();
  final TextEditingController _customerFaxTEController =
      TextEditingController();
  final TextEditingController _shippingNameTEController =
      TextEditingController();
  final TextEditingController _shippingAddressNameTEController =
      TextEditingController();
  final TextEditingController _shippingCityNameTEController =
      TextEditingController();
  final TextEditingController _shippingStateNameTEController =
      TextEditingController();
  final TextEditingController _shippingPostCodeTEController =
      TextEditingController();
  final TextEditingController _shippingCountryNameTEController =
      TextEditingController();
  final TextEditingController _shippingPhoneTEController =
      TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 22,
                      ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _customerNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Customer name')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter Customer Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _customerAddressTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Customer address')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter customer address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _customerCityTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Customer city')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter custommer city';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _customerStateTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Customer state')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter customer state';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _customerPostCodeTEController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Customer postcode')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter customer postcode';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _customerCountryTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Customer country')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter customer country';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _customerPhoneTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration:
                      (const InputDecoration(hintText: 'Customer phone')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter  customer phone';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _customerFaxTEController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  decoration: (const InputDecoration(hintText: 'Customer fax')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter customer fax';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _shippingNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Shipping name')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter shipping name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _shippingAddressNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Shipping address')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your shipping address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _shippingCityNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Shipping city')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter shipping city';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _shippingStateNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Shipping state')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter shipping state';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _shippingPostCodeTEController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Shipping postcode')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter  shipping postcode';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _shippingCountryNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      (const InputDecoration(hintText: 'Shipping country')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter shipping country';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                TextFormField(
                  controller: _shippingPhoneTEController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration:
                      (const InputDecoration(hintText: 'Shipping phone')),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter  shipping phone';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                      builder: (completeProfileController) {
                    return Visibility(
                      visible: completeProfileController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            final createProfileParams = CreateProfileParams(
                              customerName:
                                  _customerNameTEController.text.trim(),
                              customerAddress:
                                  _customerAddressTEController.text.trim(),
                              customerCity:
                                  _customerCityTEController.text.trim(),
                              customerState:
                                  _customerStateTEController.text.trim(),
                              customerPostCode:
                                  _customerPostCodeTEController.text.trim(),
                              customerCountry:
                                  _customerCountryTEController.text.trim(),
                              customerPhone:
                                  _customerPhoneTEController.text.trim(),
                              customerFax: _customerFaxTEController.text.trim(),
                              shipName: _shippingNameTEController.text.trim(),
                              shipAddress:
                                  _shippingAddressNameTEController.text.trim(),
                              shipCity:
                                  _shippingCityNameTEController.text.trim(),
                              shipState:
                                  _shippingStateNameTEController.text.trim(),
                              shipPostCode:
                                  _shippingPostCodeTEController.text.trim(),
                              shipCountry:
                                  _shippingCountryNameTEController.text.trim(),
                              shipPhone: _shippingPhoneTEController.text.trim(),
                            );
                            final bool result = await completeProfileController
                                .createProfileData(
                                    Get.find<VerifyOTPController>().token,
                                    createProfileParams);
                            if (result) {
                              Get.offAll(() => const MainBottomNavScreen());
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: 'Complete profile failed',
                                message: completeProfileController.errorMessage,
                                duration: const Duration(
                                  seconds: 2,
                                ),
                                isDismissible: true,
                              ));
                            }
                          }

                          Get.offAll(() => const MainBottomNavScreen());
                        },
                        child: const Text('Complete'),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _customerNameTEController.dispose();
    _customerAddressTEController.dispose();
    _customerCityTEController.dispose();
    _customerStateTEController.dispose();
    _customerPostCodeTEController.dispose();
    _customerCountryTEController.dispose();
    _customerPhoneTEController.dispose();
    _customerFaxTEController.dispose();
    _shippingNameTEController.dispose();
    _shippingAddressNameTEController.dispose();
    _shippingCityNameTEController.dispose();
    _shippingStateNameTEController.dispose();
    _shippingPostCodeTEController.dispose();
    _shippingCountryNameTEController.dispose();
    _shippingPhoneTEController.dispose();

    super.dispose();
  }
}
