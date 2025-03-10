import 'package:oxyboots/utils/helper/button.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/helper/appbar.dart';
import '../auth/widget/texfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  RxBool isTab = true.obs;

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppbar(
                        isTabtext: false,
                        isTabicon: true,
                        onTabtext: 'Clear All',
                        isMenu: false,
                        text2: 'Profile',
                        onTabimage: () {
                          isTab.value = false;
                        },
                        imageIcon: ImageConstants.edit,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 40.r,
                                    backgroundImage: const AssetImage(
                                        ImageConstants.profileImage),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Allison Becker',
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                              Text('Full Name',
                                  style: theme.textTheme.headlineSmall),
                              Obx(() => TexField(
                                    controller: nameController,
                                    readOnly: isTab.value,
                                    keyboardType: TextInputType.name,
                                    isTrue: false,
                                    hintText: 'Enter your name',
                                  )),
                              SizedBox(height: 10.h),
                              Text('Email Address',
                                  style: theme.textTheme.headlineSmall),
                              Obx(() => TexField(
                                    readOnly: isTab.value,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    isTrue: false,
                                    hintText: 'Enter your Email Address',
                                  )),
                              SizedBox(height: 10.h),
                              Text('Phone No',
                                  style: theme.textTheme.headlineSmall),
                              Obx(() => TexField(
                                    readOnly: isTab.value,
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    isTrue: false,
                                    hintText: 'Enter your Phone No',
                                  )),
                              SizedBox(height: 10.h),
                              Text('Address',
                                  style: theme.textTheme.headlineSmall),
                              Obx(() => TexField(
                                    readOnly: isTab.value,
                                    controller: addressController,
                                    keyboardType: TextInputType.streetAddress,
                                    isTrue: false,
                                    hintText: 'Enter your Address',
                                  )),
                              SizedBox(height: 10.h),
                              Text('Password',
                                  style: theme.textTheme.headlineSmall),
                              Obx(() => TexField(
                                    readOnly: isTab.value,
                                    controller: passwordController,
                                    keyboardType: TextInputType.visiblePassword,
                                    isTrue: false,
                                    hintText: 'Enter your Password',
                                  )),
                              SizedBox(height: 25.h),
                              CustomButton(
                                name: 'Save',
                                color: theme.primaryColor,
                                onPressButton: () {
                                  isTab.value = true;
                                  Get.back();
                                },
                                width: double.infinity,
                                height: 55,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]))));
  }
}
