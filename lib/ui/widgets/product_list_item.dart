import 'package:flutter/material.dart';

import '../utils/application_colors.dart';
import 'space.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              color: colorSecondary,
              width: double.infinity,
              height: 90,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/images/item-demo.png"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              child: Text(
                "New Year Special Shoe 30",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                children: [
                  const Text("\$100", style: TextStyle(fontSize: 10, color: colorPrimary),),
                  const Spacer(),
                  const Icon(Icons.star, size: 12, color: colorRating,),
                  horizontalSpace(2.0),
                  const Text("4.0", style: TextStyle(fontSize: 10),),
                  const Spacer(),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: colorPrimary,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Center(
                          child: Icon(Icons.favorite_border_outlined, size: 10, color: colorWhite,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}