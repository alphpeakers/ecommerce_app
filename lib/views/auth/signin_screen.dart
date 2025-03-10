import 'package:oxyboots/controller/auth_controller.dart';
import 'package:oxyboots/routes/app_pages.dart';
import 'package:oxyboots/utils/helper/button.dart';
import 'package:oxyboots/utils/helper/inkwel.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/Appcolor/app_theme.dart';
import 'package:animate_do/animate_do.dart';

import 'widget/texfield.dart';

class PhoneAuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find();
  PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isPhoneValid = false.obs;

    final theme = Theme.of(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              ImageConstants.loginImage,
            ),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    spacing: 20,
                    children: [
                      FadeInDown(
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          'Login or SignUp',
                          style: theme.textTheme.displayMedium,
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 600),
                        delay: const Duration(milliseconds: 200),
                        child: TexField(
                          maxLength: 10,
                          readOnly: false,
                          keyboardType: TextInputType.phone,
                          hintText: 'Enter Your Mobile Number',
                          controller: authController.phoneController,
                        ),
                      ),
                      Obx(() => FadeInUp(
                            duration: const Duration(milliseconds: 600),
                            delay: const Duration(milliseconds: 200),
                            child: CustomButton(
                                name: 'Continue',
                                color: authController.isPhoneValid.value
                                    ? theme.primaryColor
                                    : AppTheme.grey,
                                onPressButton: () {
                                  if (authController.isPhoneValid.value) {
                                    authController.phoneController
                                        .addListener(isPhoneValid.call);
                                    Get.offAllNamed(AppRoutes.otpScreen,
                                        arguments: {
                                          "phoneController": authController
                                              .phoneController.text
                                        });
                                  } else {
                                    Get.snackbar(
                                        'Login', 'Invalid phone number');
                                  }
                                },
                                width: double.infinity,
                                height: 55),
                          )),
                      FadeIn(
                          duration: const Duration(milliseconds: 600),
                          delay: const Duration(milliseconds: 200),
                          child: const Text('Or Continue with Google')),
                      CustomInkTap(
                          onPress: () {},
                          child: ElasticIn(
                              duration: const Duration(milliseconds: 800),
                              delay: const Duration(milliseconds: 1200),
                              child: SvgPicture.asset(ImageConstants.google))),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
