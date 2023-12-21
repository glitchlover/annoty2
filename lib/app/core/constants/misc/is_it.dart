import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsIt {
  static bool get dark => Get.theme.brightness == Brightness.dark;
  static bool get isDesktop => GetPlatform.isDesktop;
  static bool get isMobileLandscape => GetPlatform.isMobile;
}
