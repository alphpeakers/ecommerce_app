import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/Appcolor/app_theme.dart';
import '../../utils/helper/appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static List previousSearchs = [];

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

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
                onTabtext: 'Cancel',
                text: 'Search',
                isTabicon: false,
                isTabtext: true,
              ),
              SizedBox(height: 20.h),
              Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: TextField(
                  controller: searchController,
                  onSubmitted: (value) => FocusScope.of(context).unfocus(),
                  onEditingComplete: () {
                    String text = searchController.text.trim();
                    if (text.isNotEmpty) {
                      SearchScreen.previousSearchs.add(text);
                    }
                    searchController.clear();
                  },
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: "Search your shoes",
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SvgPicture.asset(
                          ImageConstants.search,
                          height: 20.h,
                        ),
                      )),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                'Shoes',
                style: theme.textTheme.headlineSmall,
              ),
              SizedBox(
                height: 500.h,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: SearchScreen.previousSearchs.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(top: 15.h),
                          child: Row(
                            spacing: 10,
                            children: [
                              SvgPicture.asset(ImageConstants.history),
                              Text(SearchScreen.previousSearchs[index],
                                  style: theme.textTheme.displaySmall)
                            ],
                          ),
                        )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
