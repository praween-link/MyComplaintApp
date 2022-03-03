import 'package:complaintapp/project/controller/common_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectUserButton extends StatelessWidget {
  const SelectUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommonController commonProvider = Provider.of<CommonController>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              commonProvider.setUser('operator');
              commonProvider.changeLoginUserType(false);
            },
            child: Text(
              'Operator',
              style: TextStyle(
                  fontSize: commonProvider.isAdmin ? 14 : 22.0,
                  fontWeight: FontWeight.w800,
                  color: commonProvider.isAdmin ? Colors.grey : Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF755fcf)
                      .withOpacity(commonProvider.isAdmin ? 0.0 : 0.9)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              commonProvider.setUser('admin');
              commonProvider.changeLoginUserType(true);
            },
            child: Text(
              'Admin',
              style: TextStyle(
                color: commonProvider.isAdmin ? Colors.white : Colors.grey,
                fontSize: commonProvider.isAdmin ? 22 : 14.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF755fcf)
                      .withOpacity(commonProvider.isAdmin ? 0.9 : 0.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
