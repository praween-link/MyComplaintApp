import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:complaintapp/project/constants/decorations.dart';
import 'package:complaintapp/project/constants/methods.dart';
import 'package:complaintapp/project/controller/admin_controller.dart';
import 'package:complaintapp/project/models/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateStatus extends StatefulWidget {
  static const routeName = '/updateStatus';
  const UpdateStatus({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;

  @override
  State<UpdateStatus> createState() => _UpdateStatusState();
}

class _UpdateStatusState extends State<UpdateStatus> {
  final formKey = GlobalKey<FormState>();
  String? selectedStatus;
  String? selectedCurrentStatus;
  //-------
  bool recorded = true;
  bool assigned = true;
  bool traveling = false;
  bool done = false;

  // String currentStatus = ''; //
  //-------
  Map<String, String> nameMap = {};
  List<String> status = ['new', 'pending', 'process', 'done'];
  List<String> processStatus = ['recorded', 'assigned', 'traveling', 'done'];
  //
  late TimeOfDay _time;
  late TimeOfDay timeOfDay;
  Future<DateTime?> _selectTime(BuildContext context) async {
    _time = (await showTimePicker(context: context, initialTime: timeOfDay))!;

    if (_time != null) {
      setState(() {
        timeOfDay = _time;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    timeOfDay = TimeOfDay.now();
  }

  void addDataOfDB() {
    var adminProvider = Provider.of<AdminController>(context);
    selectedStatus = adminProvider.issuesstatus[widget.id]!.status;
    recorded = adminProvider.issuesstatus[widget.id]!.processStatus['recorded']
        as bool;
    assigned = adminProvider.issuesstatus[widget.id]!.processStatus['assigned']
        as bool;
    traveling = adminProvider
        .issuesstatus[widget.id]!.processStatus['traveling'] as bool;
    done = adminProvider.issuesstatus[widget.id]!.processStatus['done'] as bool;
    selectedCurrentStatus =
        adminProvider.issuesstatus[widget.id]!.currentStatus;
    // timeOfDay = adminProvider.issuesstatus[widget.id]!.dates as TimeOfDay;
  }

  bool run = true;

  @override
  Widget build(BuildContext context) {
    var adminProvider = Provider.of<AdminController>(context);
    if (run) {
      addDataOfDB();
      setState(() {
        run = false;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Status'),
        backgroundColor: const Color(0xFF614ac2),
        elevation: 15,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.chevron_left,
            size: 35,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select status:',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12, top: 4, bottom: 4.0),
                            child: DropdownButton<String>(
                              value: selectedStatus,
                              items: status.map(buildMenuItem).toSet().toList(),
                              onChanged: (value) =>
                                  setState(() => selectedStatus = value),
                              isExpanded: true,
                              hint: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Select status"),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Text(
                          'Process status:',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () =>
                                    setState(() => recorded = !recorded),
                                title: const Text('Recorded'),
                                trailing: Checkbox(
                                    activeColor: const Color(0xFF755fcf),
                                    value: recorded,
                                    onChanged: (value) =>
                                        setState(() => recorded = !recorded)),
                              ),
                              ListTile(
                                onTap: () =>
                                    setState(() => assigned = !assigned),
                                title: const Text('Assigned'),
                                trailing: Checkbox(
                                    activeColor: const Color(0xFF755fcf),
                                    value: assigned,
                                    onChanged: (value) =>
                                        setState(() => assigned = !assigned)),
                              ),
                              ListTile(
                                onTap: () =>
                                    setState(() => traveling = !traveling),
                                title: const Text('Traveling'),
                                trailing: Checkbox(
                                    activeColor: const Color(0xFF755fcf),
                                    value: traveling,
                                    onChanged: (value) =>
                                        setState(() => traveling = !traveling)),
                              ),
                              ListTile(
                                onTap: () => setState(() => done = !done),
                                title: const Text('Done'),
                                trailing: Checkbox(
                                    activeColor: const Color(0xFF755fcf),
                                    value: done,
                                    onChanged: (value) =>
                                        setState(() => done = !done)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Text(
                          'Current process status:',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12.0, right: 12, top: 4, bottom: 4.0),
                            child: DropdownButton<String>(
                              value: selectedCurrentStatus,
                              items: processStatus
                                  .map(buildMenuItem)
                                  .toSet()
                                  .toList(),
                              onChanged: (value) =>
                                  setState(() => selectedCurrentStatus = value),
                              isExpanded: true,
                              hint: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Select process status"),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Text(
                          'Select time for next process:',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.15),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: ListTile(
                            onTap: () => _selectTime(context),
                            title: const Text('Select Time'),
                            subtitle: Text(
                              timeFormat(timeOfDay.hour, timeOfDay.minute),
                              // style: const TextStyle(
                              //       // color: myColor.textColor,
                              //       fontSize: 18,
                              //     ),
                            ),
                            trailing: IconButton(
                                onPressed: () => _selectTime(context),
                                icon: const Icon(Icons.arrow_drop_down)),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      var d = adminProvider.issuesstatus[widget.id]!.dates;
                      Map<String, bool> ps = {
                        'recorded': recorded,
                        'assigned': assigned,
                        'traveling': traveling,
                        'done': done
                      };
                      Map<String, String> dt = {
                        'recorded': selectedCurrentStatus == 'recorded'
                            ? DateTime.now().toString()
                            : d['recorded'].toString(),
                        'assigned': selectedCurrentStatus == 'assigned'
                            ? DateTime.now().toString()
                            : d['assigned'].toString(),
                        'traveling': selectedCurrentStatus == 'traveling'
                            ? DateTime.now().toString()
                            : d['traveling'].toString(),
                        'done': selectedCurrentStatus == 'done'
                            ? DateTime.now().toString()
                            : d['done'].toString()
                      };
                      // Map<String, String> dt = {
                      //   'recorded': selectedCurrentStatus == 'recorded'
                      //       ? timeOfDay.toString()
                      //       : d['recorded'].toString(),
                      //   'assigned': selectedCurrentStatus == 'assigned'
                      //       ? timeOfDay.toString()
                      //       : d['assigned'].toString(),
                      //   'traveling': selectedCurrentStatus == 'traveling'
                      //       ? timeOfDay.toString()
                      //       : d['traveling'].toString(),
                      //   'done': selectedCurrentStatus == 'done'
                      //       ? timeOfDay.toString()
                      //       : d['done'].toString()
                      // };
                      ComplaintStatus cs = ComplaintStatus(
                          status: selectedStatus.toString(),
                          processStatus: ps,
                          currentStatus: selectedCurrentStatus.toString(),
                          dates: dt);
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.SCALE,
                        dialogType: DialogType.WARNING,
                        body: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                'Update!',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Are you sure to update status!',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        btnCancelOnPress: () {},
                        btnCancelText: 'NO',
                        btnOkOnPress: () {
                      adminProvider.updateStatus(widget.id, cs);
                      Navigator.pop(context);
                        },
                        btnOkText: 'YES',
                      ).show();
                    },
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
