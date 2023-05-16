import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class ItemStepper extends StatelessWidget {
  ItemStepper({
    Key? key, required this.controller,
  }) : super(key: key);

  final ValueNotifier<int> _cartItemCount = ValueNotifier(1);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: _cartItemCount, builder: (context, currentValue, _) {
      controller.text = _cartItemCount.value.toString();
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
                child: const SizedBox(
                  height: 26,
                  width: 26,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.remove, size: 18, color: colorWhite,),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            width: 25,
            child: TextField(
              controller: controller,
              enabled: false,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600,),
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
              ),
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
    });
  }
}