import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        radius: 15,
        child: Icon(
          iconData,
          color: Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}
