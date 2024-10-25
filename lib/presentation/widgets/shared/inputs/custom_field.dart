import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputField extends StatelessWidget {
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final double radius;
  final double? space;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onSubmitted;
  final Function(String)? onChange;
  final EdgeInsets? scrollPadding;
  final BorderSide? borderSide;
  final bool? filled;
  final Color fillColor;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? contentPadding;
  const CustomInputField(
      {super.key,
      this.controller,
      this.hintText,
      this.inputFormatters,
      this.keyboardType,
      this.labelText,
      this.maxLength,
      this.maxLines = 1,
      this.radius = 15,
      this.space,
      this.onSubmitted,
      this.prefixIcon,
      this.onChange,
      this.scrollPadding,
      this.borderSide,
      this.filled = true,
      this.fillColor = const Color.fromARGB(55, 184, 184, 184),
      this.suffixIcon,
      this.contentPadding, this.validator});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        TextFormField(
          validator: validator,
            focusNode: FocusNode(),
            //scrollPadding: scrollPadding,
            onChanged: onChange,
            controller: controller,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            maxLength: maxLength,
            maxLines: maxLines,
            decoration: InputDecoration(
                contentPadding: contentPadding,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colors.primary, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderSide: borderSide ?? BorderSide.none,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                fillColor: fillColor,
                filled: filled,
                hintText: hintText,
                labelText: labelText,
                isDense: true,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon)),
        SizedBox(
          height: space ?? 20,
        ),
      ],
    );
  }
}
