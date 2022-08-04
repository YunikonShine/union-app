import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField(
      {Key? key,
      required this.maxLength,
      this.height = 80.0,
      this.percentSize = 1,
      this.color = Colors.white,
      required this.title,
      this.radius = 15.0,
      required this.nextFocus,
      this.minLines = 1,
      this.maxLines = 1,
      this.obscureText = false,
      required this.suffixIcon,
      required this.focus,
      required this.controller,
      this.actionButton = TextInputAction.next,
      this.inputType = TextInputType.text,
      required this.textInputFormatter,
      required this.validator,
      this.readOnly = false})
      : super(key: key);

  final int maxLength;
  final double height;
  final double percentSize;
  final Color color;
  final String title;
  final double radius;
  final FocusNode nextFocus;
  final int minLines;
  final int maxLines;
  final bool obscureText;
  final Widget suffixIcon;
  final FocusNode focus;
  final TextEditingController controller;
  final TextInputAction actionButton;
  final TextInputType inputType;
  final List<TextInputFormatter> textInputFormatter;
  final FormFieldValidator<String> validator;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      height: height,
      width: MediaQuery.of(context).size.width * percentSize,
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
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(
              color: Colors.white70,
            ),
          ),
          suffixIcon: suffixIcon,
          labelText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        validator: validator,
        onFieldSubmitted: (term) {
          // if (nextFocus != null) {
          FocusScope.of(context).requestFocus(FocusNode());
          //FocusScope.of(context).unfocus();
          FocusScope.of(context).requestFocus(nextFocus);
          // } else {
          //   FocusScope.of(context).unfocus();
          // }
        },
      ),
    );
  }
}
