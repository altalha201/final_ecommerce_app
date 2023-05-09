import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/application_colors.dart';
import '../space.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
  }) : super(key: key);

  final ValueNotifier<int> _cartItemCount = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        shadowColor: colorPrimary.withOpacity(0.2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 120,
              alignment: Alignment.center,
              child: Image.asset("assets/images/item-demo.png"),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Year Special Shoe",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: appbarTextColor.withOpacity(0.7),
                      ),
                    ),
                    verticalSpace(4.0),
                    Text(
                      "Color: Red, Size: X",
                      style: TextStyle(
                        fontSize: 12,
                        color: appbarTextColor.withOpacity(0.6),
                      ),
                      maxLines: 1,
                    ),
                    verticalSpace(20.0),
                    const Text(
                      "\$ 100",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colorPrimary,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 110,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, bottom: 16, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete_outline_outlined,
                        color: colorPrimary,
                      ),
                    ),
                    const Spacer(),
                    ValueListenableBuilder(valueListenable: _cartItemCount, builder: (context, currentValue, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_cartItemCount.value > 1) {
                                _cartItemCount.value--;
                              }
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                color: _cartItemCount.value == 1 ? colorPrimary.withOpacity(0.4) : colorPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SvgPicture.asset("assets/icons/minus_icon.svg", width: 12, color: colorWhite,),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              "${_cartItemCount.value}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_cartItemCount.value < 25) {
                                _cartItemCount.value++;
                              }
                            },
                            borderRadius: BorderRadius.circular(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                color: _cartItemCount.value == 25 ? colorPrimary.withOpacity(0.4) : colorPrimary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const SizedBox(
                                  height: 26,
                                  width: 26,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(4.0),
                                      child: Icon(Icons.add, size: 18, color: colorWhite,),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}