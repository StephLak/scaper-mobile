import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scaper_mobile/constants/app_colors.dart';
import 'package:scaper_mobile/constants/app_constants.dart';
import 'package:scaper_mobile/constants/app_styles.dart';
import 'package:scaper_mobile/shared/custom_input/app_input_border.dart';

class CustomInput extends StatefulWidget {
  final String? hint;
  final String? label;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscure;
  final bool enabled;
  final bool isRequired;
  final String? Function(String?)? validator;
  final int? maxLines;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final double labelSize;
  final String? initialValue;
  final bool enableInteractiveSelection;
  final TextInputType? inputType;
  final bool hasFillColor;
  final bool noBottomPadding;

  const CustomInput({
    super.key,
    this.hint,
    this.label,
    this.obscure = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
    this.width,
    this.enabled = true,
    this.isRequired = true,
    this.maxLines = 1,
    this.controller,
    this.inputFormatters,
    this.height,
    this.labelSize = 14,
    this.initialValue,
    this.enableInteractiveSelection = true,
    this.inputType,
    this.hasFillColor = false,
    this.noBottomPadding = false,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.enabled ? AppColors.tileColor : AppColors.greyColor;
    Widget textField = TextFormField(
      enableInteractiveSelection: widget.enableInteractiveSelection,
      initialValue: widget.initialValue,
      controller: widget.controller,
      obscureText: widget.obscure,
      enabled: widget.enabled,
      obscuringCharacter: '*',
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.inputType ?? TextInputType.text,
      maxLines: widget.maxLines,
      style: Styles.mediumTextStyle(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 25,
        ),
        errorMaxLines: 1,
        labelText: widget.hint,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelStyle: Styles.regularTextStyle(),
        counterText: '',
        focusedErrorBorder: AppInputBorders.outlineFocusedBorder,
        filled: true,
        fillColor: widget.hasFillColor ? AppColors.white : Colors.transparent,
        focusedBorder: widget.hasFillColor
            ? AppInputBorders.fillFocusedBorder
            : AppInputBorders.outlineFocusedBorder,
        disabledBorder: AppInputBorders.disabledBorder,
        border: widget.hasFillColor
            ? AppInputBorders.fillBorder
            : AppInputBorders.outlineBorder,
        enabledBorder: widget.hasFillColor
            ? AppInputBorders.fillBorder
            : AppInputBorders.outlineBorder,
      ),
      validator: widget.validator,
    );

    return Container(
      padding: EdgeInsets.only(bottom: widget.noBottomPadding ? 0 : 20),
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: widget.label,
                      style: Styles.mediumTextStyle(color: color, size: 14),
                    ),
                  ],
                ),
              ),
            ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppConstants.appRadius),
            child: textField,
          ),
          if (widget.errorText != '' && widget.errorText != null)
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5),
              child: Text(
                style: Styles.lightTextStyle(color: Colors.red, size: 12),
                widget.errorText ?? '',
              ),
            ),
        ],
      ),
    );
  }
}
