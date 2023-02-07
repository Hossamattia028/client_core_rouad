import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:client_core/features/presentation/widgets/locations_widgets/locations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class MyLocationsScreen extends StatelessWidget {
  const MyLocationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: GlobalAppBar(
        title: translate("profile.locations"),
        backGroundColor: Colors.grey.shade100,
        height: 75,
      ),
      body: const LocationsList()
    );
  }
}
