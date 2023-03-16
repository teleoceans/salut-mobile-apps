import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salute/view/components/default_form_field.dart';

import '../../../constants.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    super.key,
    this.controller,
    this.validator,
    this.prefixColor,
    this.focusColor,
    this.enabled,
  });
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Color? prefixColor;
  final Color? focusColor;
  final bool? enabled;
  @override
  State<DatePickerField> createState() => _DatePickerField();
}

class _DatePickerField extends State<DatePickerField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kPrimaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        widget.controller!.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      enabled: widget.enabled,
      textColor: Colors.white,
      focusColor: widget.focusColor,
      controller: widget.controller,
      keyboardType: TextInputType.none,
      prefixIcon: Icon(
        Icons.calendar_today,
        color: widget.prefixColor ?? Colors.white,
      ),
      validator: widget.validator,
      onTap: () {
        //_selectDate(context);
         showSheet(
          context,
          child: buildDatePicker(),
          onClicked: () {
            widget.controller?.text = DateFormat('yyyy/MM/dd').format(dateTime);
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      },
    );
  }

  Widget buildDatePicker() => SizedBox(
    height: 180,
    child: CupertinoDatePicker(
      minimumYear: 2015,
      maximumYear: DateTime.now().year,
      initialDateTime: dateTime,
      mode: CupertinoDatePickerMode.date,
      onDateTimeChanged: (dateTime) =>
          setState(() => this.dateTime = dateTime),
    ),
  );

  static void showSheet(
      BuildContext context, {
        required Widget child,
        required VoidCallback onClicked,
      }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: onClicked,
          ),
        ),
      );
}
