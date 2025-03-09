import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/homecontroller.dart';
import '../Appcolor/app_theme.dart';
import 'inkwel.dart';

class CustomAppbar extends StatelessWidget {
  final DrawerControllerX drawerController = Get.find();

  final void Function()? onTab;
  final String? text;
  final String? text2;
  final String? onTabtext;
  final bool isTabicon;
  final void Function()? onTabimage;
  final bool isTabtext;
  final String? imageIcon;
  final bool isMenu;
  CustomAppbar(
      {super.key,
      this.onTab,
      this.text,
      this.onTabtext,
      this.isTabtext = true,
      this.imageIcon,
      this.isTabicon = true,
      this.onTabimage,
      this.isMenu = true,
      this.text2});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isMenu
              ? CustomInkTap(
                  onPress: () {
                    Get.back();
                  },
                  child: Container(
                      height: 45.h,
                      width: 45.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppTheme.white),
                      child:
                          Center(child: SvgPicture.asset(ImageConstants.back))),
                )
              : Text(
                  text2.toString(),
                  style: theme.textTheme.headlineSmall,
                ),
          Expanded(
            child: Center(
              child: Text(
                text ?? '',
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
              : const SizedBox(),
          isTabicon
              ? CustomInkTap(
                  onPress: onTabimage,
                  child: Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppTheme.white),
                    child: Center(child: SvgPicture.asset(imageIcon!)),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
