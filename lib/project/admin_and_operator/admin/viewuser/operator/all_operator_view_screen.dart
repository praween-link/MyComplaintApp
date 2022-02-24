import 'package:complaintapp/project/controller/operator_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlloperatorsViewScreen extends StatelessWidget {
  const AlloperatorsViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var operatorController = Provider.of<OperatorController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Operators'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
        ),
      ),
      body: Container(
        child: operatorController.getAllOperatorFromDB(),
      ),
    );
  }
}
