import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelyuk/app/theme/app_theme.dart';

class ShimmerWidget {
  static Widget rectangular({
    required double? width,
    required double? height,
    Color? baseColor = shadowColor,
    Color? highlightColor = lightColor,
    double? borderRadius = 0,
    EdgeInsets? margin,
    EdgeInsets? padding,
    bool enabled = true,
  }) {
    return Shimmer.fromColors(
      enabled: enabled,
      baseColor: Get.theme.brightness == Brightness.dark
          ? Get.theme.colorScheme.surface
          : Get.theme.shadowColor,
      highlightColor: Get.theme.brightness == Brightness.dark
          ? Get.theme.shadowColor
          : Get.theme.colorScheme.surface,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Get.theme.shadowColor.withAlpha(150),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
      ),
    );
  }
}
