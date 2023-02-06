
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/align_child_by_row.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CancelIcon extends StatelessWidget {
  const CancelIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignChildRow(
      isStart: false,
      child: TextButton(
        onPressed: ()=> Navigator.of(context).pop(),
        child: CustomText(
            text: "❌ ${translate("button.cancel")} ",
            color: Colors.red,
            fontSize: AppStyle.verySmall.sp,
        ),
      ),
    );
  }
}
