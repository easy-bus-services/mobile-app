
import 'package:flutter/widgets.dart';
import 'package:super_admin/core/constants/widget_constants.dart';
import 'package:super_admin/core/enums/widget_enums.dart';
import 'package:super_admin/core/presentation/widgets/my_text.dart';

class CommonTextWidgets extends StatelessWidget{
  final String text;
  final WidgetTextEnum type;
  final Color? color;

  const CommonTextWidgets({
      super.key,
    required this.text,
    required this.type,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    Widget widget=Text('');
    switch (type) {
      case WidgetTextEnum.type1:
        widget= MyText(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: color ?? WidgetConstants.textDefaultColor,
        );
        break;
      case WidgetTextEnum.type2:
        widget= MyText(
            text: text,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          color: color ?? WidgetConstants.textDefaultColor,
        );
        break;
      case WidgetTextEnum.heading1:
        widget= MyText(
            text: text,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          color: color ?? WidgetConstants.textDefaultColor,
        );
        break;
      case WidgetTextEnum.heading2:
        widget=MyText(
            text: text,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          color: color ?? WidgetConstants.textDefaultColor,
        );
        break;
    }
    return widget;
  }
}