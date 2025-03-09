import 'package:oxyboots/utils/helper/inkwel.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final String? image;
  final bool isImage;
  final Color? color;
  final void Function() onPressButton;
  const CustomButton(
      {super.key,
      required this.name,
      required this.onPressButton,
      required this.width,
      required this.height,
      this.image,
      this.isImage = false,
      this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomInkTap(
      onPress: onPressButton,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.r)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isImage
                ? SvgPicture.asset(ImageConstants.google)
                : const SizedBox(),
            const SizedBox(width: 5),
            Text(name, style: theme.textTheme.labelMedium),
          ],
        )),
      ),
    );
  }
}
