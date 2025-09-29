import 'package:flutter/material.dart';

class ScreenSizesDto {

  final Size? physicalSize;
  final double? physicalWidth;
  final double? physicalHeight;
  final Size? logicalSize;
  final double? logicalWidth;
  final double? logicalHeight;

  ScreenSizesDto({
    this.physicalSize, 
    this.physicalWidth,
    this.physicalHeight,
    this.logicalSize,
    this.logicalWidth,
    this.logicalHeight
  });

}