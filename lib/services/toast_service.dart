import 'package:countries_app/widgets/toast.dart';
import 'package:flutter/material.dart';

enum ToastType { error, warning, success, defaultType }

class ToastService {
  void showToast(context,
      {required String title, required String subTitle, ToastType? type}) {
    final screenHeight = MediaQuery.of(context).size.height;

    final snackBar = SnackBar(
        width: 700.0,
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        duration: const Duration(seconds: 5),
        content: Toast(
          title: title,
          subTitle: subTitle,
          type: type,
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
