import 'package:client_core/core/styles/color.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: const CustomText(
        text: "no internet connection",
        color: kPrimary,
        fontSize: 20,
      ),
    );
  }
}
