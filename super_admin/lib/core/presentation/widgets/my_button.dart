import 'package:flutter/material.dart';
import 'package:super_admin/core/constants/widget_constants.dart';
import 'package:super_admin/core/enums/widget_enums.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final double? borderRadius;
  final double? fontSize;
  final bool isFontBold;
  final double? width;
  final double? height;
  final double? paddingVertical;
  final double? paddingHorizantal;
  final WidgetButtonEnum? buttonModel;
  final IconData? icon;
  final EdgeInsetsGeometry? iconPadding; 
  final double? iconSize;
  final String? iconTooltip;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.fontSize,
    this.width,
    this.height,
    this.paddingVertical,
    this.paddingHorizantal,
    this.buttonModel,
    this.icon,
    this.iconColor,
    this.iconPadding,
    this.iconSize,
    this.iconTooltip,
    this.isFontBold=false
  });

  @override
  Widget build(BuildContext context) {
    // Define default values
    final defaultBackgroundColor = WidgetConstants.buttonDefaultBackgroundColor;
    final defaultTextColor =  WidgetConstants.buttonDefaultTextColor;
    final defaultBorderRadius =WidgetConstants.buttonDefaultBorderRadius;
    final defaultFontSize = WidgetConstants.buttonDefaultFontSize;
    final defaultWidth = WidgetConstants.buttonDefaultWidth;
    final defaultHeight = WidgetConstants.buttonDefaultHeight;
    final defaultPaddingVertical = WidgetConstants.buttonDefaultPaddingVertical;
    final defaultPaddingHorizantal = WidgetConstants.buttonDefaultPaddingHorizantal;

    if(WidgetButtonEnum.iconButton == buttonModel){
      return IconButton(
        icon: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        onPressed: onPressed,
        tooltip: iconTooltip,
        padding: iconPadding,
      );
    }
    else {
      return SizedBox(
        width: width ?? defaultWidth,
        child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? defaultBackgroundColor,
          foregroundColor: textColor ?? defaultTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? defaultBorderRadius),
          ),
          padding: EdgeInsets.symmetric(horizontal: paddingHorizantal ?? defaultPaddingHorizantal, vertical: paddingVertical ?? defaultPaddingVertical),
          fixedSize:Size(width ?? defaultWidth, height ?? defaultHeight),
          textStyle: TextStyle(fontSize: fontSize ?? defaultFontSize, fontWeight: isFontBold? FontWeight.bold : FontWeight.normal)
        ),
        child: Text(text),
        )
      );
    }
  }
}