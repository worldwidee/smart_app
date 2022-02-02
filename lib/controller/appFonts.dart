import 'appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppFonts extends GetxController {
  double _appWidth = 0;
  double _appHeight = 0;
  late double _size1, _size2, _size3, _size4, _size5, _size6, _totalSize;
  final Map<String, double> _sizeRatios = {
    "xS": 0.007,
    "S": 0.009,
    "M": 0.012,
    "L": 0.015,
    "xL": 0.020,
    "mega": 0.030
  };
  final Map<String, double> _staticSizes = {
    "xS": 8,
    "S": 12,
    "M": 16,
    "L": 20,
    "xL": 26,
    "mega": 40
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

  void changeSizes(
      {required double width,
      required double height,
      bool isResposible = true}) {
    _appWidth = width;
    _appHeight = height;
    _totalSize = _appWidth + _appHeight;
    _size1 =
        isResposible ? _appWidth * _sizeRatios["xS"]! : _staticSizes["xS"]!;
    _size2 = isResposible ? _appWidth * _sizeRatios["S"]! : _staticSizes["S"]!;
    _size3 = isResposible ? _appWidth * _sizeRatios["M"]! : _staticSizes["M"]!;
    _size4 = isResposible ? _appWidth * _sizeRatios["L"]! : _staticSizes["L"]!;
    _size5 =
        isResposible ? _appWidth * _sizeRatios["xL"]! : _staticSizes["xL"]!;
    _size6 =
        isResposible ? _appWidth * _sizeRatios["mega"]! : _staticSizes["mega"]!;
    _iconSize = isResposible ? _totalSize * _iconRatio : _staticIconSize;
    update();
  }

  void changeStaticSize({required String name, required double size}) {
    _staticSizes[name] = size;
    update();
  }

  void changeStaticSizeRatio({required String name, required double ratio}) {
    _sizeRatios[name] = ratio;
    update();
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
  }

  void changeStaticIconRatio(double ratio) {
    _iconRatio = ratio;
    update();
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

  TextStyle mega(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size6,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle xL(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size5,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle L(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size4,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle M(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size3,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle S(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size2,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }

  TextStyle xS(
      {Color? color, bool? isBold, FontWeight fontWeight = FontWeight.normal}) {
    color ??= Get.find<AppColors>().textColor;
    return TextStyle(
        fontSize: _size1,
        color: color,
        fontWeight: isBold == null
            ? fontWeight
            : isBold
                ? FontWeight.bold
                : FontWeight.normal);
  }
}
