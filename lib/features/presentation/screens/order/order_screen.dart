import 'package:client_core/features/presentation/widgets/global_widgets/global_widgets.dart';
import 'package:client_core/features/presentation/widgets/order_widgets/order_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: GlobalAppBar(
          title: translate("profile.orders"),
          backGroundColor: Colors.grey.shade100,
          height: 75,
        ),
        body: const OrderList()
    );
  }
}
