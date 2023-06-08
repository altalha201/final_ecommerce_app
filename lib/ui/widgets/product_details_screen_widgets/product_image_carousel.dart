import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class ProductImageCarousel extends StatelessWidget {
  ProductImageCarousel({Key? key, required this.images}) : super(key: key);

  final List<String> images;

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: images.map((imgUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                    )
                  ),
                  alignment: Alignment.center,
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
                    for (int i = 0; i < images.length; i++)
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
