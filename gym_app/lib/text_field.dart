import 'package:flutter/material.dart';

class TextFieldInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData prefixIcon;
  final Color fillColor;
  final TextInputType keyboardType;


  const TextFieldInput({
    super.key,
    required this.controller,
    this.hintText = "Enter Text",
    this.obscureText = false,
    this.prefixIcon = Icons.text_fields,
    this.fillColor = const Color(0xFF000000),
    this.keyboardType = TextInputType.text
  });

  @override
  State<TextFieldInput> createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.fillColor.withOpacity(0.3),
        prefixIcon: Icon(widget.prefixIcon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}


class DropdownInput extends StatefulWidget {
  final String? value;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String hintText;
  final IconData prefixIcon;
  final Color fillColor;

  const DropdownInput({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.validator,
    required this.hintText,
    required this.prefixIcon ,
    this.fillColor = const Color(0xFF000000),
  });

  @override
  State<DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.value,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.fillColor.withOpacity(0.3),
        prefixIcon: Icon(widget.prefixIcon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none,
        ),
      ),
      items: widget.items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
