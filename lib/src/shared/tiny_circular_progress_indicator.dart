import 'package:flutter/material.dart';

import '../palette.dart';

class TinyCircularProgressIndicator extends StatelessWidget {
  const TinyCircularProgressIndicator({super.key, this.color = kAsparagus});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 16,
      child: CircularProgressIndicator(
        color: color,
        backgroundColor: Colors.transparent,
        strokeWidth: 2.0,
      ),
    );
  }
}
