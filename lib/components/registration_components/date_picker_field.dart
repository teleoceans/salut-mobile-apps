import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salute/components/default_form_field.dart';

import '../../constants.dart';

class DatePickerField extends StatefulWidget {
  const DatePickerField({
    super.key,
    this.controller,
    this.validator,
    this.prefixColor,
    this.focusColor,
  });
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final Color? prefixColor;
  final Color? focusColor;
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
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        widget.controller!.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      focusColor: widget.focusColor,
      controller: widget.controller,
      keyboardType: TextInputType.none,
      prefixIcon: Icon(
        Icons.calendar_today,
        color: widget.prefixColor ?? Colors.white,
      ),
      validator: widget.validator,
      onTap: () {
        _selectDate(context);
      },
    );
  }
}
