import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  final int number;
  final Color color;
  const NumberWidget({
    super.key,
    required this.number,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
