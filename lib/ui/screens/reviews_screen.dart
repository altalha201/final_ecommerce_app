import 'package:final_ecommerce_app/ui/screens/create_review.dart';
import 'package:final_ecommerce_app/ui/utils/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/reviews_screen_widgets/review_card.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
        leading: const BackButton(
          color: colorGray,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [for (int i = 0; i < 6; i++) const ReviewCard()],
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
            child: const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "1000 (Reviews)",
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const CreateReview());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
