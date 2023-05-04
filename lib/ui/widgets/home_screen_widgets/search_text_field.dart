import 'package:flutter/material.dart';

import '../../utils/application_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {},
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: colorGrayLite,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: colorGrayLite),
            borderRadius: BorderRadius.circular(8.0)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: colorGrayLite),
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: colorPrimary,
      ),
    );
  }
}