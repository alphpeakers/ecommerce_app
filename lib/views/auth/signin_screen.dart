import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:ecommerce_app/utils/helper/button.dart';
import 'package:ecommerce_app/utils/helper/inkwel.dart';
import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'widget/customfiled.dart';

class PhoneAuthScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    ImageConstants.loginImage,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        spacing: 20,
                        children: [
                          Text(
                            'Login or SignUp',
                            style: theme.textTheme.displayMedium,
                          ),
                          // SizedBox(height: 0.h),
                          Customfiled(
                            controller: phoneController,
                            validator: (phone) {
                              if (phone == null || phone.number.isNotEmpty) {
                                Get.snackbar('Login', 'Please enter a valid phone number');
                              }else if(phone.number.length >10){
                                Get.snackbar('Login', 'Enter a valid phone number');
                              }
                              return null;
                            },
                          ),
                          CustomButton(
                              name: 'Continue',
                              onPressButton: () {
                                if (_formKey.currentState!.validate()) {
                                  Get.offAllNamed(AppRoutes.otpScreen, arguments: {
                                    "phoneController": phoneController.text
                                  }
                                  );
                                }else{
                                   Get.snackbar('Login', 'Enter a valid4437 phone number');
                                }
                              },
                              width: double.infinity,
                              height: 55),

                          Text('Or Continue with Google'),
                          CustomInkTap(
                              onPress: () {},
                              child: SvgPicture.asset(ImageConstants.google)),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
