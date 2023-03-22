import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    this.maxLength,
    this.maxLines,
    required this.hint,
    required this.validate,
  });

  final TextEditingController controller;
  final int? maxLength;
  final int? maxLines;
  final String hint;
  final  validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: controller,
      maxLength: maxLength,
      maxLines: maxLines,
      validator: validate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        filled: true,
        fillColor: Colors.white38,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        contentPadding: const EdgeInsets.all(5),
      ),
      style:const TextStyle(color:Colors.white),
    );
  }
}
