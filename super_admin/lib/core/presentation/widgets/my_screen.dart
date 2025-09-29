import 'package:flutter/material.dart';
import 'package:super_admin/core/constants/widget_constants.dart';

class MyScreen extends StatelessWidget{
  final Widget? leading;
  final bool showAppBar;
  final double? leadingWidth;
  final Widget? title;
  final List<Widget>? actions;
  final Color? appBarBackgroundColor;
  final Color? appBarForegroundColor;
  final Color? bodyBackgroundColor;
  final Widget body;
  final bool centerTitle;
  final bool isTitleBold;
  final double? screenPaddingVertical;
  final double? screenPaddingHorizantal;
  final bool screenAlignmentCenter;
  final double? titleFontSize;
  final Drawer? sideMenu;

  const MyScreen({
    super.key,
    this.leading,
    this.leadingWidth,
    this.title,
    this.actions,
    this.appBarBackgroundColor,
    this.appBarForegroundColor,
    required this.body,
    this.showAppBar=true,
    this.centerTitle = false,
    this.isTitleBold = false,
    this.screenPaddingHorizantal,
    this.screenPaddingVertical,
    this.titleFontSize,
    this.bodyBackgroundColor,
    this.screenAlignmentCenter=false,
    this.sideMenu
  });
  
  @override
  SafeArea build(BuildContext context) {
    if(showAppBar){
      return SafeArea(
        child: Scaffold(
          backgroundColor: bodyBackgroundColor ?? Colors.grey.shade200,
          appBar: AppBar(
            leading: leading,
            leadingWidth: leadingWidth,
            title: title,
            centerTitle: centerTitle,
            titleTextStyle: TextStyle(
                fontWeight: !isTitleBold?FontWeight.bold:FontWeight.normal,
                fontSize: titleFontSize ?? WidgetConstants.appFontSize20,
              color: appBarForegroundColor ?? WidgetConstants.appBarDefaultForegroundColor
              ),
            actions: actions,
            backgroundColor: appBarBackgroundColor ?? WidgetConstants.appBarDefaultBackgroundColor,
            foregroundColor: appBarForegroundColor ?? WidgetConstants.appBarDefaultForegroundColor,
          ),
          drawer: sideMenu,
          body: screenAlignmentCenter? Center(child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: screenPaddingVertical ?? 2, horizontal: screenPaddingHorizantal ?? 2),
              child: body
          )):SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: screenPaddingVertical ?? 2, horizontal: screenPaddingHorizantal ?? 2),
              child: body
          )
        )
      );
    }
    else{
      return SafeArea(
        child:  Scaffold(
          backgroundColor: bodyBackgroundColor ?? Colors.grey.shade200,
          drawer: sideMenu,
          body: screenAlignmentCenter? Center(child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: screenPaddingVertical ?? 2, horizontal: screenPaddingHorizantal ?? 2),
            child: body
          )):SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: screenPaddingVertical ?? 2, horizontal: screenPaddingHorizantal ?? 2),
              child: body
          )
        )
      );
    }
  }
}