import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final IconData iconDate;

  const CustomIconButton({
    required this.onPressed,
    required this.iconDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: 30.0,
      color: Colors.white,
      icon: Icon(iconDate),
    );
  }
}
