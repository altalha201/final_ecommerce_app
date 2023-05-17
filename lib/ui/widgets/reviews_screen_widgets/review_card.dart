import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';
import '../space.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SizedBox(
        height: 110,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundColor: colorGrayLite,
                    child: Icon(Icons.person_outline, color: iconColor, size: 20,),
                  ),
                  horizontalSpace(8.0),
                  const Text("Rabbil Hasan", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: iconColor,
                    fontSize: 18,
                  ),)
                ],
              ),
              verticalSpace(8.0),
              const Text(
                "Reference site about Lorem Ipsum, giving information on its origins. as well as a random Lipsum generator Reference site about Lorem Ipsum. giving information on its origins. as well as random Lipsum generator",
                style: TextStyle(
                  fontSize: 11,
                  color: colorGray,
                ),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}