import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownFormField<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String Function(T) itemToString;
  final void Function(T?)? onChanged;
  final String? labelText;
  final Widget? customLabel;
  final Widget? labelPrefix;
  final String? hintText;
  final bool isExpanded;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color? backgroundColor;
  final String? errorText;
  final String? Function(T?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool enabled;
  final bool readOnly;

  const CustomDropdownFormField({
    super.key,
    required this.value,
    required this.items,
    required this.itemToString,
    this.onChanged,
    this.labelText,
    this.customLabel,
    this.labelPrefix,
    this.hintText,
    this.isExpanded = true,
    this.contentPadding,
    this.borderRadius = 5.0,
    this.borderColor = Colors.grey,
    this.focusedBorderColor = Colors.grey,
    this.backgroundColor,
    this.errorText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.hintStyle,
    this.enabled = true,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (customLabel != null) ...[
        //   customLabel!,
        //   const SizedBox(height: 8),
        // ] else if (labelText != null) ...[
        //   Row(
        //     children: [
        //       if (labelPrefix != null) ...[
        //         labelPrefix!,
        //         const SizedBox(width: 8),
        //       ],
        //       CustomText(
        //         text: labelText!,
        //         fontSize: 16,
        //         fontWeight: FontWeight.w400,
        //         color: Colors.black,
        //       ),
        //     ],
        //   ),
        //   const SizedBox(height: 8),
        // ],
        DropdownButtonFormField<T>(
          value: value,
          isExpanded: isExpanded,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: focusedBorderColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: Colors.red),
            ),
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            filled: backgroundColor != null,
            fillColor: backgroundColor,
            prefixIcon: prefixIcon,
            // suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:
                hintStyle ??
                TextStyle(
                  fontSize: (16),
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w400,
                ),
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          ),
          selectedItemBuilder: (BuildContext context) {
            return items.map<Widget>((T item) {
              return Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  itemToString(item),
                  style:
                      textStyle ??
                      const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              );
            }).toList();
          },
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(
                itemToString(item),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: enabled && !readOnly ? onChanged : null,
          validator: validator,
          icon: suffixIcon,
        ),
      ],
    );
  }
}
