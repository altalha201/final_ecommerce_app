import 'package:final_ecommerce_app/ui/state_manager/review_states/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/application_colors.dart';
import '../widgets/space.dart';

class CreateReviewScreen extends StatelessWidget {
  CreateReviewScreen({Key? key, required this.productId}) : super(key: key);

  final int productId;

  final TextEditingController reviewETController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
        leading: const BackButton(
          color: colorGray,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              verticalSpace(16.0),
              TextFormField(
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              verticalSpace(16.0),
              TextFormField(
                controller: reviewETController,
                decoration: const InputDecoration(
                  hintText: "Write Review",
                  contentPadding: EdgeInsets.all(8.0),
                ),
                maxLines: 10,
              ),
              verticalSpace(24.0),
              GetBuilder<ReviewController>(builder: (reviewController) {
                return Visibility(
                  visible: !reviewController.creatingReviews,
                  replacement: const CircularProgressIndicator(),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        reviewController
                            .createReview(productId, reviewETController.text)
                            .then((value) {
                          if (value) {
                            Get.back();
                          } else {
                            Get.showSnackbar(const GetSnackBar(
                              title: "Failed",
                              message:
                                  "Failed to create your review. Try again.",
                              duration: Duration(seconds: 3),
                            ));
                          }
                        });
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
