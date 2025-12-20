import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CustomWidgets {
  static Widget customIcon({
    required dynamic iconData,
    Color? color,
    Size? size,
    Function()? onClick,
  }) {
    final bool isSVGIcon = iconData.toString().contains("svg");

    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick();
        }
      },
      child:
      isSVGIcon
          ? SvgPicture.asset(
        iconData as String,
        width: size != null ? size.width : 26,
        height: size != null ? size.height : 28,
        alignment: Alignment.center,
        colorFilter: ColorFilter.mode(
          color ?? Colors.transparent,
          color != null ? BlendMode.srcIn : BlendMode.color,
        ),
      )
          : Icon(
        iconData as IconData,
        size: size != null ? size.width : 28,
        color: color,
      ),
    );
  }
}



String formatTimeOfDay(TimeOfDay time) {
  final String hour = time.hour.toString().padLeft(2, '0');
  final String minute = time.minute.toString().padLeft(2, '0');
  return "$hour:$minute";
}