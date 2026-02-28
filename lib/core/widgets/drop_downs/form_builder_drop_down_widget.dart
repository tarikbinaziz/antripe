import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/core.dart';
import 'package:task/core/theme/theme_extensions.dart';

class CustomFormBuilderDropdown extends StatelessWidget {
  const CustomFormBuilderDropdown({
    super.key,
    required this.formKey,
    required this.name,
    required this.items,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.heading,
    this.onChange,
    this.validator,
  });

  final GlobalKey<FormBuilderState> formKey;
  final String name;
  final List<String> items;
  final String? initialValue;
  final String? labelText;
  final String? hintText;
  final String? heading;
  final Function(String?)? onChange;
  final String? Function(String?)? validator;

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
                style: context.textTheme.bodyMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.titleLarge!.color,
                ),
              ),
              Gap(5.h),
            ],
          ),
        ],
        FormBuilderDropdown<String>(
          name: name,
          hint: Text(
            hintText ?? "",
            style: context.textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp,
              color: Theme.of(context).hintColor,
            ),
          ),
          initialValue: initialValue,
          dropdownColor: context.cardColor,
          decoration: textfieldInputDecoration(
            context: context,
            labelText: labelText,
            fillColor: context.cardColor,
          ),
          style: context.textTheme.titleMedium!.copyWith(
            fontSize: 14.sp,
            color: Theme.of(context).textTheme.titleLarge!.color,
          ),
          onChanged: onChange,
          validator: validator,

          items: items
              .map(
                (item) => DropdownMenuItem(
                  //  alignment: AlignmentDirectional.center,
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

InputDecoration textfieldInputDecoration({
  required BuildContext context,
  String? hintText,
  TextStyle? hintTextStyle,
  String? labelText,
  Widget? suffixIcon,
  Widget? preffixIcon,
  Color? fillColor,
}) {
  final bool isDark = context.isDarkMode;
  final Color resolvedFillColor =
      fillColor ?? (isDark ? AppColors.surfaceDarkElevated : AppColors.gray);
  final Color borderColor = isDark ? AppColors.borderDark : AppColors.gray;
  final Color hintColor =
      hintTextStyle?.color ?? (isDark ? AppColors.mutedDark : AppColors.hint);

  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
    labelText: labelText,
    hint: Text(
      hintText ?? "",
      style:
          hintTextStyle ??
          context.textTheme.bodyMedium!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: hintColor,
          ),
    ),
    labelStyle: context.textTheme.bodyMedium!.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: context.textTheme.bodyMedium?.color?.withOpacity(0.8),
    ),

    filled: true,
    fillColor: resolvedFillColor,
    prefixIcon: preffixIcon,
    prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    suffixIcon: suffixIcon,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: borderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.3.w),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: AppColors.error),
    ),
  );
}
