import 'package:final_ecommerce_app/ui/state_manager/review_states/review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/application_colors.dart';
import '../widgets/card_widgets/review_card.dart';
import 'create_review_screen.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key, required this.productID}) : super(key: key);

  final int productID;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<ReviewController>().getReviewsByID(widget.productID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        leading: const BackButton(
          color: colorGray,
        ),
      ),
      body: GetBuilder<ReviewController>(builder: (reviewController) {
        if (reviewController.gettingReviews) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await reviewController.getReviewsByID(widget.productID);
                    },
                    child: Column(
                      children: reviewController.readReviewsModel.reviews!
                          .map((review) => ReviewCard(review: review))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
              decoration: const BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  )),
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "${reviewController.readReviewsModel.reviews?.length ?? 0} (Reviews)",
                    style: const TextStyle(
                      color: colorBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.to(CreateReviewScreen(productId: widget.productID,));
          Get.find<ReviewController>().getReviewsByID(widget.productID);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
