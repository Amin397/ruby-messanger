import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rubymessanger/Const/Consts.dart';


typedef OnChangeStringInput = void Function(String);

class WidgetUtils{


  static Widget textFormField({
    TextEditingController? controller,
    String? label,
    int? maxLength,
    bool numeric = false,
    int? maxLines,
    bool? enable,
    TextAlign? textAlign,
    TextInputAction? inputAction,
    Color fillColor = Colors.white,
    List<TextInputFormatter> formatter = const [],
    OnChangeStringInput? onChange,
    Color? borderColor,
    FocusNode? focusNode,
    double? hintSize,
    double? height,
    double? width,
    Widget? prefixWidget,
    bool? autoFocus,
    TextStyle? textStyle,
    Function(String)? func,
    Color? focusedColor,
    Color? hintTextColor = Colors.grey,
  }) {
    if (borderColor == null) {
      borderColor = Colors.grey.withOpacity(0.1);
      hintTextColor = Colors.black;
    }

    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: TextField(
          onSubmitted: (text){
            func!(text);
          },
          textInputAction: inputAction,
          enabled: enable,
          autofocus: autoFocus!,
          maxLength: maxLength,
          focusNode: focusNode,
          textAlign: textAlign!,
          keyboardType: (numeric) ? TextInputType.number : TextInputType.text,
          maxLines: maxLines,
          onChanged: onChange,
          controller: controller,
          inputFormatters: formatter,
          style: textStyle,
          decoration: InputDecoration(
            counterText: "",
            prefixIcon: prefixWidget,
            fillColor: fillColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: radiusAll10,
              borderSide: BorderSide(
                color: borderColor,
                width: 0.5,
                style: BorderStyle.solid,
              ),
            ),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: focusedColor!,
              ),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(173, 179, 191, 1),
                width: 0.5,
                style: BorderStyle.solid,
              ),
            ),
            hintText: label,
            errorStyle: TextStyle(
              color: Colors.red.shade600,
              fontSize: 10.0,
            ),
            hintStyle: TextStyle(
              color: hintTextColor,
              fontSize: hintSize,
              fontFamily: 'iranSanc'
            ),
          ),
        ),
      ),
    );
  }

}