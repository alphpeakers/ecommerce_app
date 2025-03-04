import 'package:ecommerce_app/model/home_model/brand_model.dart';
import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:ecommerce_app/utils/helper/inkwel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/Appcolor/app_theme.dart';
import '../../../utils/image_constants.dart';

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular Shoes', style: theme.textTheme.headlineSmall),
            Text('See all', style: theme.textTheme.bodySmall)
          ],
        ),
        SizedBox(height: 15.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              spacing: 15,
              children: List.generate(
                PopularCardModel.listItem.length,
                (index) {
                  final data = PopularCardModel.listItem[index];
                  return Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      CustomInkTap(
                        onPress: () => Get.toNamed((AppRoutes.detailsScreen),arguments: data),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 13.h),
                            decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                    style: theme.textTheme.bodySmall),
                                Text(
                                  data.title,
                                  style: theme.textTheme.headlineSmall,
                                ),
                                Text(
                                  data.price,
                                  style: theme.textTheme.bodyMedium,
                                )
                              ],
                            )),
                      ),
                      Positioned(
                          left: 10,
                          top: 10,
                          child: InkWell(
                              child: SvgPicture.asset(ImageConstants.like)))
                    ],
                  );
                },
              )),
        ),
        SizedBox(height: 20.h),
        //New arrivals
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('New Arrivals', style: theme.textTheme.headlineSmall),
            Text('See all', style: theme.textTheme.bodySmall)
          ],
        ),
        SizedBox(height: 15.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.h),
          decoration: BoxDecoration(
              color: AppTheme.white, borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BEST CHOICE', style: theme.textTheme.bodySmall),
                  SizedBox(height: 3.h),
                  Text(
                    'Nike  Air Joradan',
                    style: theme.textTheme.headlineSmall,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '300',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(
                width: 100.w,
                height: 100.h,
                //color: Colors.amber,
                child: Image.asset(ImageConstants.shoe),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
