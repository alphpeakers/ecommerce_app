import 'package:oxyboots/utils/helper/inkwel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/favoritecontroller.dart';
import '../../utils/Appcolor/app_theme.dart';
import '../../utils/helper/appbar.dart';
import '../../utils/image_constants.dart';

class FavouriteScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find();
  final CurrencyFormatter currencyController = Get.find();
  FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomAppbar(
                        imageIcon: ImageConstants.like,
                        onTab: () {},
                        onTabtext: 'Clear All',
                        isMenu: false,
                        text2: 'Favourite',
                        isTabicon: true,
                        isTabtext: false,
                      ),
                      SizedBox(height: 10.h),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Obx(() {
                              return favoriteController.favouriteItem.isEmpty
                                  ? const Text("No favorite items yet")
                                  : GridView.builder(
                                      shrinkWrap: true,
                                      itemCount: favoriteController
                                          .favouriteItem.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 0.75,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 25,
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        final data = favoriteController
                                            .favouriteItem[index];
                                        return Stack(
                                          alignment: Alignment.topLeft,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w,
                                                    vertical: 13.h),
                                                decoration: BoxDecoration(
                                                    color: AppTheme.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  spacing: 5,
                                                  children: [
                                                    SizedBox(
                                                      width: 100.w,
                                                      height: 100.h,
                                                      //color: Colors.amber,
                                                      child: Image.asset(
                                                        data.image,
                                                      ),
                                                    ),
                                                    Text(data.name,
                                                        style: theme.textTheme
                                                            .bodySmall),
                                                    Text(
                                                      data.title,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: theme.textTheme
                                                          .headlineSmall,
                                                    ),
                                                    Row(
                                                      spacing: 8,
                                                      children: [
                                                        Text(
                                                          currencyController
                                                              .formatPrice(double
                                                                  .parse(data
                                                                      .price)),
                                                          style: theme.textTheme
                                                              .bodyMedium,
                                                        ),
                                                        const Spacer(),
                                                        CircleAvatar(
                                                          radius: 10.r,
                                                          child: CircleAvatar(
                                                            radius: 8.r,
                                                            backgroundColor:
                                                                Colors
                                                                    .redAccent,
                                                          ),
                                                        ),
                                                        CircleAvatar(
                                                          radius: 10.r,
                                                          child: CircleAvatar(
                                                            radius: 8.r,
                                                            backgroundColor:
                                                                Colors
                                                                    .redAccent,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )),
                                            Positioned(
                                                left: 10,
                                                top: 10,
                                                child: Obx(() {
                                                  bool isFav =
                                                      favoriteController
                                                          .isfavourite(data);
                                                  return CustomInkTap(
                                                      onPress: () {
                                                        if (isFav) {
                                                          favoriteController
                                                              .removeFromFavorites(
                                                                  data);
                                                        } else {
                                                          favoriteController
                                                              .addTofavourite(
                                                                  data);
                                                        }
                                                      },
                                                      child: SvgPicture.asset(
                                                        ImageConstants.like,
                                                        color: isFav
                                                            ? AppTheme.warning
                                                            : AppTheme.info,
                                                      ));
                                                }))
                                          ],
                                        );
                                      },
                                    );
                            }),
                          ],
                        ),
                      )
                    ]))));
  }
}
