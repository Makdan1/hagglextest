import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:hagglextest/utils/colors.dart';

customYMargin(double value) {
  return SizedBox(height: value);
}

customXMargin(double value) {
  return SizedBox(width: value);
}
String isEmail(value) {
  if (value.isEmpty) {
    return 'Email cannot be empty';
  }
  else if (!RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$")
      .hasMatch(value)) {
    return 'Email is invalid';
  }
  return null;
}

String isEmpty(value) {
  if (value.isEmpty) {
    return 'Field cannot be empty';
  }
  return null;
}

String isPassword( value) {
  if (value.isEmpty) {
    return 'Password cannot be empty';
  }
  else if ( value.length < 8) {
    return 'Min of 8 password';
  }
  return null;
}

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      webPosition: "center",
      webBgColor: "#e74c3c",
      timeInSecForIosWeb: 5,
      // backgroundColor: AppColors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

String capitalize(val) {
  return "${val[0].toUpperCase()}${val.substring(1)}";
}

formatDate(value) {
  final df = new DateFormat('dd-MM-yyyy');
  return df.format(DateTime.parse(value));
}

formatDateTime(value) {
  final df = new DateFormat('d MMMM, y hh:mm a');
  return df.format(DateTime.parse(value));
}

class Status {
  static final sent = 'sent';
  static final delivered = 'delivered';
  static final read = 'read';
}
