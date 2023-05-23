import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class ProductImageCarousel extends StatelessWidget {
  ProductImageCarousel({Key? key}) : super(key: key);

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: [1, 2, 3, 4, 5].map((e) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "$e",
                    style: const TextStyle(fontSize: 16.0),
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(
              height: 200.0,
              viewportFraction: 1,
              autoPlay: true,
              onPageChanged: (index, _) {
                _currentIndex.value = index;
              }),
        ),
        Positioned.fill(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: ValueListenableBuilder(
              valueListenable: _currentIndex,
              builder: (context, currentValue, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          height: 10, width: 10,
                          decoration: BoxDecoration(
                            color: currentValue == i
                                ? colorPrimary
                                : colorWhite,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        )),
      ],
    );
  }
}
