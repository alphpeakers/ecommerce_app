import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/Appcolor/app_theme.dart';

class TexField extends StatelessWidget {
  final FocusNode _focusNode = FocusNode();
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool isTrue;
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool readOnly;
  TexField({
    super.key,
    this.validator,
    required this.controller,
    this.isTrue = true,
    required this.hintText,
    required this.keyboardType,
    this.maxLength,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          TextFormField(
            maxLength: maxLength,
            validator: validator,
            controller: controller,
            cursorColor: AppTheme.dark,
            keyboardType: keyboardType,
            readOnly: readOnly,
            focusNode: _focusNode,
            autocorrect: true,
            decoration: InputDecoration(
              counterText: "",
              hintText: hintText,
              fillColor: isTrue ? AppTheme.lightGrey : AppTheme.white,
              filled: true,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGrey),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppTheme.lightGrey),
              ),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppTheme.lightGrey)),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 15.h, horizontal: isTrue ? 58.w : 16.w),
            ),
          ),
          isTrue
              ? Positioned(
                  left: 10.w,
                  top: 2.h,
                  child: Row(
                    children: [
                      const Text('+91'),
                      Container(
                        width: 0.5,
                        height: 48.h,
                        color: AppTheme.background,
                      ),
                    ],
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
