import 'package:final_ecommerce_app/ui/utils/application_colors.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < 6; i++)
                    const ReviewCard()
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: colorSecondary,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  )
                ),
                alignment: Alignment.center,
                child: Text("1000 (Reviews)",),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
