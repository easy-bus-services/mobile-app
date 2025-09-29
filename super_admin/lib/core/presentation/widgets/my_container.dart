import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget{
  final Widget child;
  final double? vertical;
  final double? horizantal;
  final double? width;
  final double? height;
  const MyContainer({
    super.key,
    required this.child,
    this.vertical,
    this.width,
    this.height,
    this.horizantal
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      padding: EdgeInsets.symmetric(horizontal: horizantal ?? 8.0,vertical: vertical ?? 8),
      child: child,
    );
  }

  
  
}