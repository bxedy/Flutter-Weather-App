import 'package:flutter/material.dart';

final kTextFormFieldDecoration = InputDecoration(
  hintText: 'Example: Chicago',
  hintStyle: TextStyle(color: Colors.blueGrey.withOpacity(1), fontSize: 15),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide(color: Colors.white)),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(color: Colors.blueGrey.shade900),
  ),
  filled: true,
  fillColor: Colors.blueGrey.shade900,
);

final kSettingsPickerDecoration = BoxDecoration(
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(8), topRight: Radius.circular(8)),
  color: Colors.blueGrey.shade900.withOpacity(0.1),
);
