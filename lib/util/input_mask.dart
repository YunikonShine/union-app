import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMask {
  static MaskTextInputFormatter mask(String mask) {
    return MaskTextInputFormatter(mask: mask, filter: {"0": RegExp(r'[0-9]')});
  }
}
