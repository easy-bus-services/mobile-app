import 'package:flutter/material.dart';
import 'package:super_admin/core/constants/widget_constants.dart';
import 'package:super_admin/core/enums/widget_enums.dart';

class MyText extends StatelessWidget {
  final String? text;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final WidgetTextEnum? textType;
  final double? fontSize;
  final FontWeight? fontWeight; 

  const MyText({
    this.textType,
    this.text,
    super.key,
    this.color,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontSize,
    this.fontWeight
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextColor = WidgetConstants.textDefaultColor;
    final defaultTextFontSize = WidgetConstants.textDefaultFontSize;
    final defaultTextFontWeight = WidgetConstants.textDefaultFontWeight;
    return Text(
              text ?? '',
              style: TextStyle(
                        fontSize: fontSize ?? defaultTextFontSize,
                        fontWeight: fontWeight ?? defaultTextFontWeight,
                        color: color ?? defaultTextColor,
                      ),
              textAlign: textAlign,
              overflow: overflow,
              maxLines: maxLines,
            );
  }

 /* Widget getWidgetType(WidgetTextEnum type){



    Widget widget=Text('');

      switch (type) {
        case WidgetTextEnum.type1:
            widget=Text(
                          text ?? '',
                          style: TextStyle(
                                    fontSize: fontSize ?? defaultTextFontSize,
                                    fontWeight: fontWeight ?? defaultTextFontWeight,
                                    color: color ?? defaultTextColor,
                                  ),
                          textAlign: textAlign,
                          overflow: overflow,
                          maxLines: maxLines,
                        );
          break;
        case WidgetTextEnum.type2:
            widget=Text(
                          text ?? '',
                          style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color:  color ?? defaultTextColor,
                                  ),
                          textAlign: textAlign,
                          overflow: overflow,
                          maxLines: maxLines,
                        );
          break;
        case WidgetTextEnum.heading1:
            widget=Text(
                          text ?? '',
                          style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color:  color ?? defaultTextColor,
                                  ),
                          textAlign: textAlign,
                          overflow: overflow,
                          maxLines: maxLines,
                        );
          break;
        case WidgetTextEnum.heading2:
            widget=Text(
                          text ?? '',
                          style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: color ?? defaultTextColor
                                  ),
                          textAlign: textAlign,
                          overflow: overflow,
                          maxLines: maxLines,
                        );
          break;
      }
    return widget;
  }*/
}

