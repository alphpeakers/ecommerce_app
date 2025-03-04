import 'package:flutter/material.dart';

class CustomInkTap extends StatelessWidget {
  final void Function()? onPress ;
  final  Widget? child;
  const CustomInkTap({super.key,  this.onPress, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      enableFeedback: false,
      highlightColor: Colors.transparent,
      onTap: onPress,
      child: child,
    );
  }
}
