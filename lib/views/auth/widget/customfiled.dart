import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../utils/Appcolor/app_theme.dart';

class Customfiled extends StatelessWidget {
  final  String? Function(PhoneNumber?)? validator;
  final TextEditingController controller;
  const Customfiled({
    super.key,  this.validator, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Stack(
            children: [
              IntlPhoneField(
                initialCountryCode: 'IN',
                textAlign: TextAlign.left,
                controller: controller ,
                showCountryFlag: false,
                validator: validator,
                dropdownIconPosition: IconPosition.trailing,
                dropdownIcon: Icon(Icons.keyboard_arrow_down),
                disableAutoFillHints: false,
                disableLengthCheck: true,
                flagsButtonMargin: EdgeInsets.all(15),
                pickerDialogStyle:
                    PickerDialogStyle(padding: EdgeInsets.all(35)),
                decoration: InputDecoration(
                  hintText: 'Enter Your No',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20.w, top: 14.h),
                ),
              ),
              Positioned(
                left: 80,
                top: 8,
                child: Container(
                  width: 1,
                  height: 40,
                  color: AppTheme.lightGrey,
                ),
              ),
            ],
          ),
        ));
  }
}
