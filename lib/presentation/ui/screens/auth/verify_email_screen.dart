import 'package:craftybay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/verify_otp_screen.dart';
import 'package:craftybay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
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
                  height: 160,
                ),
                const AppLogo(
                  height: 80,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: (const InputDecoration(hintText: 'Email')),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 7,
                ),
                GetBuilder<SendEmailOtpController>(builder: (controller) {
                  return SizedBox(
                      width: double.infinity,
                      child: Visibility(
                        visible: controller.inProgress == false,
                        replacement: const Center(
                          child: CircularProgressIndicator(),
                        ),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                final bool result =
                                    await controller.sendOtpToEmail(
                                        _emailTEController.text.trim());
                                if (result) {
                                  Get.to(() => VerifyOTPScreen(
                                        email: _emailTEController.text.trim(),
                                      ));
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: 'Send OTP failed',
                                      message: controller.errorMessage,
                                      duration: const Duration(seconds: 2),
                                      isDismissible: true,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text('Next')),
                      ));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
