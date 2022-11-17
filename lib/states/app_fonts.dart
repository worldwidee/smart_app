import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../functions/functions.dart';
import '../smart_app.dart';
import 'app_colors.dart';

class AppFonts extends GetxController {
  double _appWidth = 0;
  double _appHeight = 0;
  double _sensedSize = 0;
  late double _size1,
      _size2,
      _size3,
      _size4,
      _size5,
      _size6,
      _size7,
      _totalSize;
  final Map<String, double> _sizeRatios = {
    "xS": 0.009,
    "S": 0.012,
    "M": 0.015,
    "L": 0.020,
    "xL": 0.025,
    "mega": 0.030,
    "giga": 0.040
  };
  final Map<String, double> _sizeIconRatios = {
    "xS": 0.009,
    "S": 0.012,
    "M": 0.015,
    "L": 0.020,
    "xL": 0.025,
    "mega": 0.032,
    "giga": 0.045
  };

  final Map<String, double> _staticSizes = {
    "xS": 14,
    "S": 18,
    "M": 22,
    "L": 28,
    "xL": 36,
    "mega": 45,
    "giga": 60
  };
  final Map<String, double> _staticIconSizes = {
    "xS": 12,
    "S": 20,
    "M": 30,
    "L": 45,
    "xL": 60,
    "mega": 80,
    "giga": 110
  };

  double _iconRatio = 0.02, _staticIconSize = 20;
  late double _iconSize;
  final Map<String, double> _specificSizes = {};

  get iconRatio => _iconRatio;
  get staticIconSize => _staticIconSize;
  get iconSize => _iconSize;
  get appWidth => _appWidth;
  get appHeight => _appHeight;
  get totalSize => _totalSize;

  double specificSize(String name) {
    return _specificSizes[name]!;
  }

  double get icon_xS => !Get.find<AppSettings>().anyMobile
      ? _staticIconSizes["xS"]!
      : _sensedSize * _sizeIconRatios["xS"]!;
  double get icon_S => !Get.find<AppSettings>().anyMobile
      ? _staticIconSizes["S"]!
      : _sensedSize * _sizeIconRatios["S"]!;
  double get icon_M => !Get.find<AppSettings>().anyMobile
      ? _staticIconSizes["M"]!
      : _sensedSize * _sizeIconRatios["M"]!;
  double get icon_L => !Get.find<AppSettings>().anyMobile
      ? _staticIconSizes["L"]!
      : _sensedSize * _sizeIconRatios["L"]!;
  double get icon_xL => !Get.find<AppSettings>().anyMobile
      ? _staticIconSizes["xL"]!
      : _sensedSize * _sizeIconRatios["xL"]!;
  double get icon_mega => !Get.find<AppSettings>().anyMobile
      ? _staticIconSizes["mega"]!
      : _sensedSize * _sizeIconRatios["mega"]!;
  double get icon_giga => !Get.find<AppSettings>().anyMobile
      ? _staticIconSizes["giga"]!
      : _sensedSize * _sizeIconRatios["giga"]!;

  void init(BuildContext context, {bool? staticSize}) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final platform = Theme.of(context).platform;
    Get.find<AppSettings>().isMobile = false;
    Get.find<AppSettings>().isDesktop = false;
    Get.find<AppSettings>().isWeb = false;
    if (platform == TargetPlatform.android ||
        platform == TargetPlatform.iOS ||
        platform == TargetPlatform.fuchsia) {
      Get.find<AppSettings>().isMobile = true;
    } else if (kIsWeb) {
      Get.find<AppSettings>().isWeb = true;
    } else {
      Get.find<AppSettings>().isDesktop = true;
    }
    bool? anyMobile = _appWidth != 0 ? Get.find<AppSettings>().anyMobile : null;
    _appWidth = width;
    _appHeight = height;
    Get.find<AppSettings>().midMode = false;
    Get.find<AppSettings>().mobileMode = false;
    Get.find<AppSettings>().largeMode = false;
    if (width < 900) {
      Get.find<AppSettings>().mobileMode = true;
    } else if (width > 900 && width <= 1100) {
      Get.find<AppSettings>().midMode = true;
    } else {
      Get.find<AppSettings>().largeMode = true;
    }
    if (_appWidth > _appHeight) {
      Get.find<AppSettings>().landScape = true;
      if (Get.find<AppSettings>().anyMobile) {
        _sensedSize = _appWidth * 2;
      } else {
        _sensedSize = _appWidth + _appHeight;
      }
    } else {
      _sensedSize = _appWidth + _appHeight;
    }
    if (kIsWeb &&
        anyMobile != null &&
        Get.find<AppSettings>().anyMobile != anyMobile) {
      Get.find<PageState>().disposeFunc();
    }
    _totalSize = _appWidth + _appHeight;
    _size1 = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * (_sizeRatios["xS"]!)
        : _staticSizes["xS"]!;
    _size2 = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * (_sizeRatios["S"]!)
        : _staticSizes["S"]!;
    _size3 = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * (_sizeRatios["M"]!)
        : _staticSizes["M"]!;
    _size4 = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * (_sizeRatios["L"]!)
        : _staticSizes["L"]!;
    _size5 = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * (_sizeRatios["xL"]!)
        : _staticSizes["xL"]!;
    _size6 = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * (_sizeRatios["mega"]!)
        : _staticSizes["mega"]!;
    _size7 = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * (_sizeRatios["giga"]!)
        : _staticSizes["giga"]!;
    _iconSize = Get.find<AppSettings>().anyMobile && staticSize != true
        ? _sensedSize * _iconRatio
        : _staticIconSize;
    update();
    Get.find<AppSettings>().update();
  }

  void changeStaticSize({required String name, required double size}) {
    _staticSizes[name] = size;
    update();
    Get.find<AppSettings>().update();
  }

  void changeStaticSizeRatio({required String name, required double ratio}) {
    _sizeRatios[name] = ratio;
    update();
    Get.find<AppSettings>().update();
  }

  void addSpecificSize({required double size, required String name}) {
    _specificSizes[name] = size;
  }

  void removeSpecificSize(String name) {
    _specificSizes.removeWhere((key, value) => key == name);
  }

  void changeStaticIconSize(double size) {
    _staticIconSize = size;
    update();
    Get.find<AppSettings>().update();
  }

  void listenState(State state) {
    void Function() setState = updateState(state);
    addListener(setState);
    Get.find<PageState>().setDispose = () {
      removeListener(setState);
    };
  }

  void changeStaticIconRatio(double ratio) {
    _iconRatio = ratio;
    update();
    Get.find<AppSettings>().update();
  }

  TextStyle specific(
      {required String specificType,
      Color? color,
      bool? isBold,
      FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _specificSizes[specificType],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle giga(
      {Color? color,
      bool? isBold,
      bool? isStatic,
      FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: isStatic == null
            ? _size7
            : isStatic
                ? _staticSizes["giga"]
                : _sizeRatios["giga"],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle mega(
      {Color? color,
      bool? isBold,
      bool? isStatic,
      FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: isStatic == null
            ? _size6
            : isStatic
                ? _staticSizes["mega"]
                : _sizeRatios["mega"],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle xL(
      {Color? color,
      bool? isBold,
      bool? isStatic,
      FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: isStatic == null
            ? _size5
            : isStatic
                ? _staticSizes["xL"]
                : _sizeRatios["xL"],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle L(
      {Color? color,
      bool? isBold,
      FontWeight fontWeight = FontWeight.normal,
      bool? isStatic}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: isStatic == null
            ? _size4
            : isStatic
                ? _staticSizes["L"]
                : _sizeRatios["L"],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle M(
      {Color? color,
      bool? isBold,
      FontWeight fontWeight = FontWeight.normal,
      bool? isStatic}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: isStatic == null
            ? _size3
            : isStatic
                ? _staticSizes["M"]
                : _sizeRatios["M"],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle S(
      {Color? color,
      bool? isBold,
      FontWeight fontWeight = FontWeight.normal,
      bool? isStatic}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: isStatic == null
            ? _size2
            : isStatic
                ? _staticSizes["S"]
                : _sizeRatios["S"],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle xS(
      {Color? color,
      bool? isBold,
      FontWeight fontWeight = FontWeight.normal,
      bool? isStatic}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: isStatic == null
            ? _size1
            : isStatic
                ? _staticSizes["xS"]
                : _sizeRatios["xS"],
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }
}
