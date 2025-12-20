import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parafeed/common/textstyle.dart';

import 'app_color.dart';
import 'custom_widgets.dart';



// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {

  final String? hintText, labelText;
  final bool isCompulsory, readOnly, isPassword, isEnable, showDisableBorder;
  final TextEditingController? controller;
  final Object? prefixIcon, suffixIcon;
  final double? prefixIconPadding;
  final double? textFieldWidth;
  final void Function()? onTap;
  final int maxLines, minLines;
  final String? Function(String? value)? validator;
  final TextInputType? keyboardType;
  final Function()? onClickSuffix, onClickPrefix;
  final Function(String value)? onChanged;
  final List<TextInputFormatter>? textInputFormatter;
  final Color? suffixIconColor;
  final Widget? label;
  final int? maxLength;
  final FocusNode? focusNode;
  final Widget? prefix;
  final Widget? suffix;
  final String? errorText;

  CustomTextField({
    super.key,
    required this.hintText,
    this.labelText,
    this.textInputFormatter,
    this.keyboardType,
    this.isCompulsory = false,
    this.isEnable = true,
    this.readOnly = false,
    this.showDisableBorder = false,
    this.controller,
    this.onTap,
    this.prefixIcon,
    this.prefixIconPadding,
    this.suffixIcon,
    this.textFieldWidth,
    this.maxLines = 1,
    this.validator,
    this.onClickSuffix,
    this.onClickPrefix,
    this.onChanged,
    this.isPassword = false,
    this.suffixIconColor,
    this.minLines = 1,
    this.label,
    this.maxLength,
    this.focusNode,
    this.prefix,
    this.suffix,
    this.errorText
  });

  @override
  Widget build(BuildContext context) =>
      TextFormField(
        autofocus: false,
        onTap: onTap,
        readOnly: readOnly,
        maxLength: maxLength,
        onChanged: onChanged,
        controller: controller,
        focusNode: focusNode,
        enabled: isEnable,
        validator: validator,
        obscureText: isPassword,
        maxLines: maxLines,
        minLines: minLines,
        keyboardType: keyboardType,
        style: regularTextStyle(color: Colors.black),
        inputFormatters: textInputFormatter ?? [
          if (keyboardType == TextInputType.emailAddress) ...[
            TextInputFormatter.withFunction((oldValue, newValue) =>
                TextEditingValue(
                  text: newValue.text.toLowerCase(),
                  selection: newValue.selection,
                ),
            ),
          ],
        ],
        decoration: InputDecoration(
          alignLabelWithHint: true,
          counterText: "",
          hintText: hintText,
          hintStyle: regularTextStyle(color: textMuted, fontSize: 12),
          labelStyle: regularTextStyle(
              color: secondaryLighter, fontSize: 12),
          filled: true,
          fillColor: Colors.white,
          errorText: errorText,
          labelText: labelText,
          label: label,
          border: _outlineInputBorder,
          disabledBorder: showDisableBorder
              ? _disableBorder
              : _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          focusedBorder: _outlineFocusedInputBorder,
          focusedErrorBorder: _outlineInputBorder,
          focusColor: primary,
          suffixIcon: suffixIcon != null
              ? Padding(
            padding: const EdgeInsets.all(11.0),
            child: CustomWidgets.customIcon(
              iconData: suffixIcon,
              onClick: () {
                if (onClickSuffix != null) {
                  onClickSuffix!();
                }
              },
              size: const Size(24, 24),
              color: suffixIconColor,
            ),
          ) : null,
          prefixIcon: prefixIcon != null
              ? Padding(
            padding: EdgeInsets.all(prefixIconPadding ?? 10.0),
            child: CustomWidgets.customIcon(
                iconData: prefixIcon,
                onClick: () {
                  if (onClickPrefix != null) {
                    onClickPrefix!();
                  }
                },
                size: Size(18, 18),
                color: textMuted
            ),
          ) : null,
          prefix: prefix,
          suffix: suffix,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 5, horizontal: 10),
        ),
      );

  final OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: secondaryLighter, width: 1),
  );

  final OutlineInputBorder _outlineFocusedInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: primary, width: 1),
  );

  final OutlineInputBorder _disableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.transparent, width: 1),
  );
}