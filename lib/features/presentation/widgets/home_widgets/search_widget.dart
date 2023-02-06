import 'package:client_core/core/styles/color.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);
  static TextEditingController searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: CustomTextFromField(
        onChanged: (val) {},
        hintText: translate("app_bar.search"),
        labelText: "",
        radius: 10,
        textEditingController: searchTextEditingController,
        cursorColor: kPrimary,
        validator: () {},
        prefixIcon: IconButton(
          onPressed: () {},
          // onPressed: () => ctx.read<AuthBloc>().add(const ChangePasswordEvent()),
          icon: const Icon(
            CupertinoIcons.search,
            color: kBackGround,
          ),
        ),
        smallPadding: true,
        obscureText: true,
        hasBorder: true,
        suffixIcon: IconButton(
          onPressed: () {},
          // onPressed: () => ctx.read<AuthBloc>().add(const ChangePasswordEvent()),
          icon: const Icon(
            Icons.filter_list_alt,
            color: kBackGround,
          ),
        ),
        isLabelError: false,
      ),
    );
  }
}
