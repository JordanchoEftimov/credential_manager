import 'package:flutter/material.dart';

class PinCircle extends StatelessWidget {
  final bool _fillCircle;

  const PinCircle({Key? key, required bool fillCircle})
      : _fillCircle = fillCircle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.all(
        10.0,
      ),
      decoration: BoxDecoration(
        color: _fillCircle ? Colors.red : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.red,
          width: 1.0,
        ),
      ),
    );
  }
}
