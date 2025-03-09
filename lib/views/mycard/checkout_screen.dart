import 'package:oxyboots/routes/app_pages.dart';
import 'package:oxyboots/utils/helper/appbar.dart';
import 'package:oxyboots/utils/helper/inkwel.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Appcolor/app_theme.dart';
import 'widget/Dialog_box.dart';
import 'widget/bottom_sheet.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final itemData = CheckOutModel.itemList;

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        bottomSheet: CustomBottomSheet(
          buttonText: 'Payment',
          onPress: () => showPaymentSuccessDialog(context),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: SingleChildScrollView(
                    child: Column(
                  spacing: 25,
                  children: [
                    CustomAppbar(
                      text: 'Checkout',
                      isTabicon: false,
                      isTabtext: false,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(12.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Contact Information',
                                  style: theme.textTheme.headlineSmall),
                              CustomInkTap(
                                  onPress: () =>
                                      Get.toNamed(AppRoutes.profileScreen),
                                  child: SvgPicture.asset(ImageConstants.edit))
                            ],
                          ),
                          informationTitle(theme, model: itemData[0]),
                          informationTitle(theme, model: itemData[1]),
                          Text('Address', style: theme.textTheme.headlineSmall),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('1082 Airport Road, Nigeria',
                                  style: theme.textTheme.labelSmall),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(height: 8.h),
                          Text('Payment Method',
                              style: theme.textTheme.headlineSmall),
                          informationTitle(theme, model: itemData[2]),
                        ],
                      ),
                    )
                  ],
                )))));
  }

  Widget informationTitle(ThemeData theme, {required CheckOutModel model}) {
    return ListTile(
      contentPadding: EdgeInsets.only(right: 2.w),
      title: Text(model.title, style: theme.textTheme.displaySmall),
      subtitle: Text(model.subTitle, style: theme.textTheme.labelSmall),
      leading: Container(
        height: 30.h,
        width: 30.w,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: AppTheme.lightGrey,
            borderRadius: BorderRadius.circular(8.r)),
        child: SvgPicture.asset(model.leading),
      ),
      trailing: SvgPicture.asset(model.trialing ?? ''),
    );
  }
}

class CheckOutModel {
  String title;
  String subTitle;
  String leading;
  String? trialing;

  CheckOutModel({
    required this.title,
    required this.subTitle,
    required this.leading,
    this.trialing,
  });
  static List<CheckOutModel> itemList = [
    CheckOutModel(
      title: 'rukmani123@gmail.com',
      subTitle: 'Email',
      leading: ImageConstants.email,
    ),
    CheckOutModel(
      title: '+238747784792',
      subTitle: 'Phone',
      leading: ImageConstants.call,
    ),
    CheckOutModel(
        title: 'Paypal Card',
        subTitle: '*** *** 02378 323',
        leading: ImageConstants.paypal,
        trialing: ImageConstants.arrowdown),
  ];
}
