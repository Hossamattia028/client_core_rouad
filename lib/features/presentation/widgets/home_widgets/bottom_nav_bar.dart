
import 'package:client_core/core/util/app_style.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../../../core/styles/color.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600
        ),
        unselectedItemColor: kPrimary,
        items: [
          BottomNavigationBarItem(icon:  const Icon(CupertinoIcons.square_grid_2x2, color:kPrimary,),label: translate("app_bar.home")),
          BottomNavigationBarItem(icon:  const Icon(CupertinoIcons.search, color:kPrimary,),label: translate("app_bar.search")),
          BottomNavigationBarItem(icon:  const Icon(CupertinoIcons.person, color:kPrimary,),label: translate("app_bar.profile")),
        ],
    );
  }
}

