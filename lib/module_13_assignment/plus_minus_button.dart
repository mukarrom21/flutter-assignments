import 'package:flutter/material.dart';

class PlusMinusButton extends StatelessWidget {
  const PlusMinusButton({
    super.key,
    required this.icon,
    required this.function,
  });

  final Icon icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Material(
      // shadow
      elevation: 4.0,
      shape: const CircleBorder(),
      child: CircleAvatar(
        // shadow
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: function,
          icon: icon,
        ),
      ),
    );
  }
}
