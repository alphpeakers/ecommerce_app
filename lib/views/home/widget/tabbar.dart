// import 'package:oxyboots/controller/homecontroller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import '../../../utils/Appcolor/app_theme.dart';
// import '../../../utils/image_constants.dart';

// class CustomTab extends StatelessWidget {
//   final TabBarController controller;
//   const CustomTab({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return TabBar(
//         dividerColor: Colors.transparent,
//         isScrollable: true,
//         indicator: BoxDecoration(
//           color: Colors.blueAccent,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         labelColor: Colors.white,
//         unselectedLabelColor: Colors.grey,
//         controller: controller.tabController,
//         indicatorColor: Colors.transparent,
//         tabs: [
//           for (var tab in ["Buy", "Deposit", "Withdrawal", "Transfer"])
//             Container(
//                 padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(25.r),
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                         height: 35.h,
//                         width: 35.w,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle, color: AppTheme.white),
//                         child: Center(
//                             child: SvgPicture.asset(ImageConstants.myCard))),
//                     SizedBox(width: 9.w),
//                     Tab(
//                       child: Text(
//                         tab,
//                         //style: theme.textTheme.titleSmall,
//                       ),
//                     ),
//                     SizedBox(width: 10.w),
//                   ],
//                 ))
//         ]);
//   }
// }
