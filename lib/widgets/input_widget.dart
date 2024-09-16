import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        // border: const OutlineInputBorder(),
        // prefixIcon: Icon(Icons.search),
        // suffixIcon: Icon(Icons.search),
        // helperText: "Helper text",
        labelText: label,
        // errorText: "Error text",
        // helperStyle: TextStyle(
        //   color: Colors.red,
        // ),
      ),
    );
  }
}
