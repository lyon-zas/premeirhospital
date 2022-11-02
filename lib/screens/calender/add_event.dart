import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:premierhospitaladmin/screens/calender/calender_model.dart';
import 'package:premierhospitaladmin/utils/colors.dart';
import 'package:premierhospitaladmin/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../provider/event_provider.dart';

class AddEventPage extends StatefulWidget {
  final Event? event;
  const AddEventPage({super.key, this.event});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formkey = GlobalKey<FormFieldState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now().add(Duration(hours: 2));
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: primaryColor,
          leading: CloseButton(
            color: Colors.white,
          ),
          actions: buildEditingActions()),
      body: SingleChildScrollView(
        child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(fontSize: 24),
                  controller: titleController,
                  validator: (title) => title != null && title.isEmpty
                      ? "Title cannot be empty"
                      : null,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(), hintText: "Add Title"),
                  onFieldSubmitted: (_) {},
                ),
                SizedBox(
                  height: 12,
                ),
                buildDateTimePicker(),
              ],
            )),
      ),
    );
  }

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.transparent, shadowColor: Colors.transparent),
            onPressed: () {
              saveForm();
            },
            icon: const Icon(Icons.done),
            label: const Text("Save"))
      ];

  Widget buildDateTimePicker() => Column(
        children: [buildFrom(), buildTo()],
      );
  Widget buildFrom() => buildHeader(
        header: 'FROM',
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: buildDropDownField(
                    text: toDates(fromDate),
                    onClicked: () => pickfromDateTime(pickDate: true))),
            Expanded(
                child: buildDropDownField(
                    text: toTime(fromDate),
                    onClicked: () => pickfromDateTime(pickDate: false)))
          ],
        ),
      );
  Widget buildTo() => buildHeader(
        header: 'TO',
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: buildDropDownField(
                    text: toDates(toDate),
                    onClicked: () => pickToDateTime(pickDate: true))),
            Expanded(
                child: buildDropDownField(
                    text: toTime(toDate),
                    onClicked: () => pickToDateTime(pickDate: false)))
          ],
        ),
      );
  Widget buildDropDownField({
    required String text,
    required onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({required String header, required Widget child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child
        ],
      );
  Future pickfromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }
    setState(() {
      fromDate = date;
    });
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;

    setState(() {
      toDate = date;
    });
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2010, 8),
          lastDate: DateTime(2101));
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    }
  }

  Future saveForm() async {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      final event = Event(
          title: titleController.text,
          description: '',
          from: fromDate,
          to: toDate);
      // final provider = Provider.of<EventProvider>(context,
      //     listen: provider.addEvents(event));
      Navigator.pop(context);
    }
  }
}
