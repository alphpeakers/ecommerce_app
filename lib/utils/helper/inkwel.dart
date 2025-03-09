import 'package:flutter/material.dart';

class CustomInkTap extends StatelessWidget {
  final void Function()? onPress ;
  final void Function()? onDoubleTap ;
  final  Widget? child;
  const CustomInkTap({super.key,  this.onPress, this.child, this.onDoubleTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: onDoubleTap,
      splashColor: Colors.transparent,
      enableFeedback: false,
      highlightColor: Colors.transparent,
      onTap: onPress,
      child: child,
    );
  }
}
