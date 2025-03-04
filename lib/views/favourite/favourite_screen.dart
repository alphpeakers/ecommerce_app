import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../model/home_model/brand_model.dart';
import '../../utils/Appcolor/app_theme.dart';
import '../../utils/helper/appbar.dart';
import '../../utils/image_constants.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      CustomAppbar(
                        text: 'Favourite',
                        imageIcon: ImageConstants.like,
                        isTabicon: true,
                        isTabtext: false,
                      ),
                      SizedBox(height: 25.h),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: PopularCardModel.listItem.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 25,
                            mainAxisExtent: 220,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          final data = PopularCardModel.listItem[index];

                          return Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 13.h),
                                  decoration: BoxDecoration(
                                      color: AppTheme.white,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
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
                                          style: theme.textTheme.bodySmall),
                                      Text(
                                        data.title,
                                        style: theme.textTheme.headlineSmall,
                                      ),
                                      Row(
                                        spacing: 8,
                                        children: [
                                          Text(
                                            data.price,
                                            style: theme.textTheme.bodyMedium,
                                          ),
                                          Spacer(),
                                          CircleAvatar(
                                            radius: 10,
                                            child: CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Colors.redAccent,
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 10,
                                            child: CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Colors.redAccent,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              Positioned(
                                  left: 10,
                                  top: 10,
                                  child: InkWell(
                                      child: SvgPicture.asset(
                                          ImageConstants.like)))
                            ],
                          );
                        },
                      )
                    ])))));
  }
}
