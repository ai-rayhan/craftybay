import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _reviewTEController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _firstNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'First Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _lastNameTEController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _reviewTEController,
                  maxLines: 10,
                  textInputAction: TextInputAction.none,
                  decoration: const InputDecoration(hintText: ' Write Review'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your Review';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          Get.showSnackbar(
                            const GetSnackBar(
                              isDismissible: true,
                              title: 'Submit',
                              message: 'Review added',
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      child: const Text('Submit')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
