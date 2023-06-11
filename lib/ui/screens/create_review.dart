import 'package:flutter/material.dart';

import '../utils/application_colors.dart';
import '../widgets/space.dart';

class CreateReview extends StatelessWidget {
  const CreateReview({Key? key, required this.productId}) : super(key: key);

  final int productId;

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
                decoration: const InputDecoration(
                  hintText: "First Name"
                ),
              ),
              verticalSpace(16.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Last Name"
                ),
              ),
              verticalSpace(16.0),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Write Review"
                ),
                maxLines: 10,
              ),
              verticalSpace(24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
