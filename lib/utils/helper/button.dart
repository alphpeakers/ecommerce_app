import 'package:ecommerce_app/utils/Appcolor/app_theme.dart';
import 'package:ecommerce_app/utils/helper/inkwel.dart';
import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;
  final String? image;
  final bool isImage;
  final void Function() onPressButton;
  const CustomButton(
      {super.key,
      required this.name,
      required this.onPressButton,
      required this.width,
      required this.height,
      this.image,
      this.isImage = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomInkTap(
      onPress: onPressButton,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            color: isImage ? AppTheme.info : theme.primaryColor,
            borderRadius: BorderRadius.circular(10.r)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isImage ? SvgPicture.asset(ImageConstants.google) : SizedBox(),
            SizedBox(width: 5),
            Text(name, style: theme.textTheme.labelMedium),
          ],
        )),
      ),
    );
  }
}
