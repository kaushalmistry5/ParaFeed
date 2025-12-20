import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parafeed/common/app_color.dart';
import 'package:parafeed/common/textstyle.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final String btnText;
  final bool isOutline;
  const AppButton({super.key, required this.onTap, required this.btnText, this.isOutline = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: double.infinity,
        minWidth: 100,
        maxHeight: 55,
        minHeight: 55,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isOutline ? Colors.white : primary,
            elevation: 0,

            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isOutline ? primary : Colors.transparent,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onTap,
          child: Text(btnText, style: littleDarkTextStyle(fontSize: 14,color: isOutline ? primary : Colors.white),)
      ),
    );
  }
}
