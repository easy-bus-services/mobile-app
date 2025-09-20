import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final double? fontSize;

  const MyElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.size,
    this.fontSize
  });

  @override
  Widget build(BuildContext context) {
    // Define default values
    final defaultBackgroundColor = Theme.of(context).primaryColor;
    final defaultTextColor = Colors.white;
    final defaultBorderRadius = 8.0;
    final defaultFontSize = 8.0;
    final defaultSize = Size(100, 40);
    final defaultPadding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? defaultBackgroundColor,
        foregroundColor: textColor ?? defaultTextColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? defaultBorderRadius),
        ),
        padding: padding ?? defaultPadding,
        fixedSize:size ?? defaultSize,
        textStyle: TextStyle(fontSize: fontSize ?? defaultFontSize)
      ),
      child: Text(text),
    );
  }
}