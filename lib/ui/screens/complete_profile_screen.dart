import 'package:final_ecommerce_app/ui/widgets/common_elevated_button.dart';
import 'package:final_ecommerce_app/ui/widgets/common_input_field.dart';
import 'package:flutter/material.dart';

import '../widgets/space.dart';
import '../widgets/title_widgets.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TitleWidgets(title: "Complete Profile", subtitle: "Get started with us with your details"),
                  const CommonInputField(hint: "First Name"),
                  verticalSpace(8.0),
                  const CommonInputField(hint: "Last Name"),
                  verticalSpace(8.0),
                  const CommonInputField(hint: "Mobile"),
                  verticalSpace(8.0),
                  const CommonInputField(hint: "City"),
                  verticalSpace(8.0),
                  const CommonInputField(hint: "Shipping Address", maxLines: 4,),
                  verticalSpace(16.0),
                  CommonElevatedButton(title: "Complete", onTap: () {})
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
