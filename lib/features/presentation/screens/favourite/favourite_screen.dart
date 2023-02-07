import 'package:client_core/core/styles/color.dart';
import 'package:client_core/features/presentation/widgets/favourite_widgets/favourite_list.dart';
import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: GlobalAppBar(
        title: translate("profile.wishlist"),
        backGroundColor: Colors.grey.shade100,
        height: 75,
      ),
      body:  const FavouriteList(),
    );
  }
}
