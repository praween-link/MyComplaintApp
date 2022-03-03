import 'package:complaintapp/project/constants/decorations.dart';
import 'package:flutter/material.dart';

class AssignToOperator extends StatefulWidget {
  static const routeName = '/addComplains';
  const AssignToOperator({
    Key? key,
  }) : super(key: key);

  @override
  State<AssignToOperator> createState() => _AssignToOperatorState();
}

class _AssignToOperatorState extends State<AssignToOperator> {
  final formKey = GlobalKey<FormState>();
  String? select;
  String desc = '';
  Map<String, String> nameMap = {};
  List<String> ids = ['Operator-1', 'Operator-2'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assign Issue To Operator'),
        backgroundColor: const Color(0xFF614ac2),
        elevation: 15,
        leading: Builder(
          builder: (BuildContext context) => GestureDetector(
            child: Image.asset('assets/img/menu_icon.png'),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              "Assign Issue To Operator",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: const Color(0xFF6b5da6),
                            ),
                            child: DropdownButton<String>(
                              value: select,
                              items: ids.map(buildMenuItem).toSet().toList(),
                              onChanged: (value) =>
                                  setState(() => select = value),
                              isExpanded: true,
                              hint: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Select Operator"),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          onChanged: (v) {
                            setState(() {
                              desc = v;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            // fillColor: Colors.grey[100],
                            hintText: "Your Discriptions...",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 28.0, right: 28.0, top: 10),
                      child: Container(
                        height: 60,
                        child: const Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                            ),
                          ),
                        ),
                        decoration: boxDecoration2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
}
