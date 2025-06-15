
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final Icon prefixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword ? isObscured : false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: widget.isPassword ? IconButton(
          onPressed: (){
            setState(() {
              isObscured = !isObscured;
            });
          }, 
          icon: isObscured ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
        ) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        )
      ),
    );
  }
}