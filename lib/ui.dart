import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final Function(String) func;
  final TextInputType keyboardType;

  const Input({
    super.key, this.labelText = '',
    required this.func,
    this.keyboardType = TextInputType.none
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          fillColor: const Color(0xFFF5F5F9),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: labelText,
      ),
      onChanged: func
    );
  }
}