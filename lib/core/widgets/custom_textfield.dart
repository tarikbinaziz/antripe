import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/core.dart';
import 'package:task/core/theme/theme_extensions.dart';
import 'package:task/core/widgets/drop_downs/form_builder_drop_down_widget.dart';

class CustomTextFieldWithHeading extends StatelessWidget {
  final int? maxLine;
  final String? heading;
  final String textFieldName;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool? readOnly;
  final TextStyle? hintTextStyle;
  final Color? fillColor;
  final Function(String?)? onChanged;
  final bool? enable;
  final String? labelText;
  final bool? isRequired;

  const CustomTextFieldWithHeading({
    super.key,
    this.initialValue,
    this.maxLine,
    this.heading,
    required this.textFieldName,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.textInputAction,
    this.focusNode,
    this.readOnly,
    this.hintTextStyle,
    this.prefixIcon,
    this.fillColor,
    this.onChanged,
    this.enable,
    this.labelText,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading != null) ...[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading ?? "",
                style: context.textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gap(5.h),
            ],
          ),
        ],

        FormBuilderTextField(
          enabled: enable ?? true,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          initialValue: initialValue,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText ?? false,
          name: textFieldName,
          controller: controller,
          maxLines: maxLine ?? 1,
          keyboardType: keyboardType ?? TextInputType.name,
          cursorColor: AppColors.primaryColor,
          style: context.textTheme.bodyLarge!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
          decoration: textfieldInputDecoration(
            context: context,
            hintText: hintText,
            labelText: labelText,
            hintTextStyle: hintTextStyle,
            suffixIcon: suffixIcon,
            preffixIcon: prefixIcon,
          ),
          validator: isRequired == true
              ? FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ])
              : null,
        ),
      ],
    );
  }
}
