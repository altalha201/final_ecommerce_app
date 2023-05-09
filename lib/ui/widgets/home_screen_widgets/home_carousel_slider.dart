import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';
import '../space.dart';

class HomeCarouselSlider extends StatelessWidget {
  HomeCarouselSlider({
    Key? key,
  }) : super(key: key);

  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            autoPlay: true,
            onPageChanged: (index, _) {
              _currentCarouselIndex.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList(),
        ),
        verticalSpace(6.0),
        ValueListenableBuilder(
          valueListenable: _currentCarouselIndex,
          builder: (context, currentValue, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: currentValue == i ? colorPrimary : null,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: colorGray.withOpacity(0.5)),
                      ),
                    ),
                  )
              ],
            );
          },
        ),
        verticalSpace(4.0),
      ],
    );
  }
}