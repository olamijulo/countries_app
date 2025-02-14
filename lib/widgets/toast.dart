import 'package:countries_app/services/toast_service.dart';
import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
  final String title;
  final String subTitle;
  final ToastType? type;

  const Toast(
      {super.key, required this.title, required this.subTitle, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: type == ToastType.success ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 250.0,
                child: Text(subTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
          InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
