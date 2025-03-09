import 'package:animate_do/animate_do.dart';
import 'package:oxyboots/controller/favoritecontroller.dart';
import 'package:oxyboots/utils/helper/appbar.dart';
import 'package:oxyboots/utils/helper/inkwel.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/dashboard_controller.dart';
import '../../routes/app_pages.dart';
import '../../utils/Appcolor/app_theme.dart';
import '../../utils/helper/button.dart';
import 'widget/bottom_sheet.dart';

class MycardScreen extends StatelessWidget {
  final CurrencyFormatter currencyController = Get.find();
  final CheckoutController checkoutController = Get.find();
  // final CheckoutController checkoutController = Get.put(CheckoutController());
  MycardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        bottomSheet: CustomBottomSheet(
          buttonText: 'CheckOut',
          onPress: () => Get.toNamed(AppRoutes.checkOutScreen),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: Column(
                  children: [
                    CustomAppbar(
                      text: 'MyCart',
                      isTabicon: false,
                      isTabtext: false,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Obx(() {
                              return checkoutController.cardItem.isEmpty
                                  ? const Center(
                                      child: Text("No favorite items yet"))
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          checkoutController.cardItem.length,
                                      itemBuilder: (context, index) {
                                        final data =
                                            checkoutController.cardItem[index];
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 80.h,
                                                width: 80.w,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: Image.asset(
                                                  data.image,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15.w,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 130.w,
                                                    height: 20.h,
                                                    child: Text(
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      '${data.title}!@#eewrerererwioieierwioerwioioerwioerwio',
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Text(
                                                    currencyController
                                                        .formatPrice(
                                                            double.parse(
                                                                data.price)),
                                                    style: theme
                                                        .textTheme.bodyMedium,
                                                  ),
                                                  const SizedBox(height: 13),
                                                  Row(
                                                    spacing: 15,
                                                    children: [
                                                      CustomInkTap(
                                                        onPress: () {},
                                                        child:
                                                            const CircleAvatar(
                                                          radius: 12,
                                                          backgroundColor:
                                                              AppTheme.white,
                                                          child: Center(
                                                              child: Icon(
                                                            Icons.remove,
                                                            size: 18,
                                                          )),
                                                        ),
                                                      ),
                                                      Text(data.quantity
                                                          .toString()),
                                                      CustomInkTap(
                                                        onPress: () {},
                                                        child:
                                                            const CircleAvatar(
                                                          radius: 12,
                                                          backgroundColor:
                                                              AppTheme.primary,
                                                          child: Center(
                                                              child: Icon(
                                                            Icons.add,
                                                            color:
                                                                AppTheme.white,
                                                            size: 18,
                                                          )),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Spacer(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                spacing: 30,
                                                children: [
                                                  Text('XXL',
                                                      style: theme.textTheme
                                                          .headlineSmall),
                                                  CustomInkTap(
                                                    onPress: () {
                                                      Get.dialog(
                                                        barrierDismissible:
                                                            false,
                                                        Dialog(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(15
                                                                        .r), // Rounded corners
                                                          ),
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(16),
                                                            width:
                                                                250, // Set custom width
                                                            height:
                                                                130, // Set custom height
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              spacing: 10,
                                                              children: [
                                                                FadeInDown(
                                                                  duration: const Duration(
                                                                      milliseconds:
                                                                          200),
                                                                  child: Text(
                                                                    'Are you sure you want \nto Delete this cart?',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: theme
                                                                        .textTheme
                                                                        .headlineSmall,
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    FadeInUp(
                                                                        duration: const Duration(
                                                                            milliseconds:
                                                                                200),
                                                                        child:
                                                                            CustomButton(
                                                                          name:
                                                                              'Cancel',
                                                                          onPressButton: () =>
                                                                              Get.back(),
                                                                          width:
                                                                              80,
                                                                          height:
                                                                              30,
                                                                          color:
                                                                              AppTheme.grey,
                                                                        )),
                                                                    FadeInUp(
                                                                      duration: const Duration(
                                                                          milliseconds:
                                                                              200),
                                                                      child:
                                                                          CustomButton(
                                                                        name:
                                                                            'Delete',
                                                                        onPressButton:
                                                                            () {
                                                                          checkoutController
                                                                              .removeFromCart(data);
                                                                          Get.back();
                                                                        },
                                                                        width:
                                                                            80,
                                                                        height:
                                                                            30,
                                                                        color: AppTheme
                                                                            .dark,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: SvgPicture.asset(
                                                        ImageConstants.delete),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                            }),
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
