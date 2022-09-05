import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    Key? key,
    required this.title,
    this.removeDefaultMargin = false,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.nextFocus,
    this.focus,
    this.suffixIcon,
    this.controller,
    this.textInputFormatter,
    this.validator,
    this.obscureText = false,
    this.actionButton = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.readOnly = false,
  }) : super(key: key);

  final String title;

  final bool removeDefaultMargin;
  final int? maxLength;
  final int? minLines;
  final int maxLines;

  final FocusNode? nextFocus;
  final FocusNode? focus;

  final Widget? suffixIcon;

  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatter;
  final FormFieldValidator<String>? validator;

  final bool obscureText;
  final TextInputAction actionButton;
  final TextInputType inputType;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: removeDefaultMargin ?  null : const EdgeInsets.only(bottom: 15.0),
      height: 80,
      width: MediaQuery.of(context).size.width * 1,
      child: TextFormField(
        readOnly: readOnly,
        focusNode: focus,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText,
        textInputAction: actionButton,
        maxLength: maxLength,
        textCapitalization: TextCapitalization.none,
        keyboardType: inputType,
        inputFormatters: textInputFormatter,
        style: TextStyle(
          color: readOnly ? Colors.grey : Colors.white,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: readOnly ? Colors.grey : Colors.white70,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: readOnly ? Colors.grey : Colors.white70,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: suffixIcon,
          labelText: title,
          labelStyle: TextStyle(
            color: readOnly ? Colors.grey : Colors.white,
          ),
          counterStyle: TextStyle(
            color: readOnly ? Colors.grey : Colors.white,
          ),
        ),
        validator: validator,
        onFieldSubmitted: (term) {
          if (nextFocus != null) {
            FocusScope.of(context).unfocus();
            FocusScope.of(context).requestFocus(nextFocus);
          } else {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }
}
