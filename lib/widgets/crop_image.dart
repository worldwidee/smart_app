import 'dart:io';
import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_avatar/flutter_advanced_avatar.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

class CropImage extends StatefulWidget {
  Uint8List mainImage;
  String? text;
  String saveText, resetText, previewText, title;
  void Function(Uint8List image)? onChanged;
  CropImage(
      {required this.mainImage,
      this.text,
      this.onChanged,
      this.saveText = "Save",
      this.resetText = "Reset",
      this.previewText = "Preview",
      this.title = "Crop image as 1/1 ratio"});

  @override
  _CropImageState createState() => _CropImageState(mainImage, text, onChanged);
}

class _CropImageState extends State<CropImage> {
  Uint8List mainImage;
  Uint8List? croppedImage;
  final _controller = CropController();
  String? text;
  void Function(Uint8List image)? onChanged;
  _CropImageState(this.mainImage, this.text, this.onChanged);
  AppSettings appSettings = Get.find<AppSettings>();
  AppFonts appFonts = Get.find<AppFonts>();
  AppColors appColors = Get.find<AppColors>();
  @override
  void dispose() {
    super.dispose();
  }

  double girth = 10, length = 30;
  int sayac = 0;
  bool isPreview = false, cropping = false;
  @override
  Widget build(BuildContext context) {
    double width =
        appSettings.mobileMode ? appFonts.appWidth : appFonts.appWidth * 0.5;
    double height = width * 3 / 4;
    double croppedW = appFonts.appWidth * 0.3;
    double croppedH = croppedW * 3 / 4;
    double paddingH = appFonts.appWidth * 0.05;
    double paddingV = appFonts.appHeight * 0.05;
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          if (!appSettings.anyMobile)
            Text(
              widget.title,
              style: appFonts.L(),
            ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: width,
                  height: height,
                  child: Container(
                    width: isPreview ? croppedW : width,
                    height: isPreview ? croppedH : height,
                    alignment: Alignment.center,
                    child: !isPreview
                        ? cropping
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Crop(
                                image: mainImage,
                                aspectRatio: 1 / 1,
                                withCircleUi: false,
                                baseColor: Colors.grey[300]!,
                                controller: _controller,
                                cornerDotBuilder: (x, y) {
                                  sayac++;
                                  if (sayac == 5) sayac = 1;

                                  return Row(
                                    crossAxisAlignment: sayac == 1 || sayac == 2
                                        ? CrossAxisAlignment.start
                                        : CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: sayac == 2 || sayac == 4
                                            ? length
                                            : girth,
                                        height: sayac == 2 || sayac == 4
                                            ? girth
                                            : length,
                                        color: Colors.black,
                                        child: SizedBox(),
                                      ),
                                      Container(
                                        width: sayac == 2 || sayac == 4
                                            ? girth
                                            : length,
                                        height: sayac == 2 || sayac == 4
                                            ? length
                                            : girth,
                                        color: Colors.black,
                                        child: SizedBox(),
                                      ),
                                    ],
                                  );
                                },
                                onCropped: (image) {
                                  setState(() {
                                    cropping = false;
                                    croppedImage = image;
                                    isPreview = true;
                                  });
                                })
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AdvancedAvatar(
                                  size: (appSettings.mobileMode
                                      ? croppedW
                                      : croppedW / 2),
                                  statusColor: Colors.green,
                                  image: Image.memory(croppedImage!).image,
                                  foregroundDecoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: appColors.textColor,
                                      width: 5.0,
                                    ),
                                  )),
                              if (text != null)
                                Text(
                                  text!,
                                  style: appFonts.M(isBold: true),
                                )
                            ],
                          ),
                  ),
                ),
                Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            if (isPreview) {
                              croppedImage = null;
                              isPreview = false;
                              setState(() {});
                            } else {
                              setState(() {
                                cropping = true;
                              });
                              _controller.crop();
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              width: appFonts.appWidth *
                                  (appSettings.mobileMode ? 0.2 : 0.1),
                              height: appFonts.appHeight * 0.06,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color:
                                    !isPreview ? Colors.grey[700] : Colors.blue,
                              ),
                              child: Text(
                                isPreview
                                    ? widget.resetText
                                    : widget.previewText,
                                style: appSettings.mobileMode
                                    ? appFonts.S(color: Colors.white)
                                    : appFonts.M(color: Colors.white),
                              )),
                        ),
                        if (isPreview)
                          TextButton(
                            onPressed: () {
                              if (onChanged != null) onChanged!(croppedImage!);
                              Navigator.pop(context);
                            },
                            child: AnimatedContainer(
                                duration: Duration(milliseconds: 100),
                                width: appFonts.appWidth *
                                    (appSettings.mobileMode ? 0.2 : 0.1),
                                height: appFonts.appHeight * 0.06,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.green[700],
                                ),
                                child: Text(
                                  widget.saveText,
                                  style: appSettings.mobileMode
                                      ? appFonts.S(color: Colors.white)
                                      : appFonts.M(color: Colors.white),
                                )),
                          )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

cropImage(
    {required BuildContext context,
    required Uint8List mainImage,
    String? text,
    void Function(Uint8List image)? onChanged}) {
  smartDialog(
      child: CropImage(mainImage: mainImage, text: text, onChanged: onChanged),
      noAction: true,
      zeroPadding: Get.find<AppSettings>().anyMobile ? true : false,
      context: context);
}
