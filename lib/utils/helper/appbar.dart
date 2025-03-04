import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../Appcolor/app_theme.dart';
import 'inkwel.dart';

class CustomAppbar extends StatelessWidget {
  final void Function()? onTab;
  final String? text;
  final String? onTabtext;
  final bool isTabicon;
  final bool isTabtext;
  final String? imageIcon;
  const CustomAppbar(
      {super.key,
      this.onTab,
      this.text,
      this.onTabtext,
      this.isTabtext = true,
      this.imageIcon,
      this.isTabicon = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomInkTap(
          onPress: () {
            Get.back();
          },
          child: Container(
              height: 45.h,
              width: 45.w,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
              child: Center(child: SvgPicture.asset(ImageConstants.back))),
        ),
        Expanded(
          child: Center(
            child: Text(
              text.toString(),
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ),
        isTabtext
            ? CustomInkTap(
                onPress: onTab,
                child: Text(
                  onTabtext.toString(),
                  style: theme.textTheme.bodySmall,
                ),
              )
            : SizedBox(),
        isTabicon
            ? Container(
                height: 45.h,
                width: 45.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppTheme.white),
                child: Center(child: SvgPicture.asset(imageIcon!)),
              )
            : SizedBox()
      ],
    );
  }
}
