import 'package:flutter/material.dart';

import '../utils/application_colors.dart';

class CommonInputField extends StatelessWidget {
  const CommonInputField({
    Key? key,
    required this.hint,
    this.controller,
    this.validator,
    this.inputType,
    this.maxLines,
  }) : super(key: key);

  final String hint;
  final TextEditingController? controller;
  final Function(String?)? validator;
  final TextInputType? inputType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (validator != null) {
          validator!(value);
        }
        return null;
      },
      keyboardType: inputType,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
          hintText: hint,
          hintMaxLines: 1,
          hintStyle: const TextStyle(color: colorGray),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 4.0,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorPrimary, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: colorPrimary, width: 2),
          )),
    );
  }
}
