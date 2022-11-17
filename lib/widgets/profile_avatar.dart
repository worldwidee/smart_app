import 'dart:io';
import 'dart:typed_data';
import 'package:boxicons/boxicons.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';

import 'on_hover.dart';

class ProfileAvatar extends StatelessWidget {
  String? url;
  String? profileName;
  double? size;
  double? iconSize;
  double borderWith;
  bool noAction;
  Widget? child;
  Color? statusColor;
  ImageProvider<Object>? image, defaultImage;
  bool isEdit;
  void Function()? onClick;
  ProfileAvatar(
      {Key? key, this.url,
      this.profileName,
      this.onClick,
      this.borderWith = 5,
      this.isEdit = true,
      this.image,
      this.noAction = false,
      this.defaultImage,
      this.iconSize,
      this.size}) : super(key: key) {
    if (profileName != null) {
      child = Text(
        getShort(profileName!),
        style: Get.find<AppFonts>().M(color: Colors.white),
      );
    }
  }
  String getShort(String name) {
    name = name.trim();
    List<String> names = name.split(" ");
    String shortForm = "";
    shortForm += names.first[0].toUpperCase();
    if (names.length > 1) shortForm += names.last[0].toUpperCase();
    return shortForm;
  }

  @override
  Widget build(BuildContext context) {
    return !noAction
        ? OnHover(
            doTransform: false,
            builder: (isHovered) {
              return Container(
                width: size ?? double.infinity,
                height: size ?? double.infinity,
                child: Stack(
                  children: [
                    TextButton(
                      onPressed: () {
                        onClick!();
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: viewImage(isHovered),
                    ),
                    if (isHovered)
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {
                          onClick!();
                        },
                        child: Center(
                          child: Icon(
                            isEdit ? Icons.edit : Boxicons.bx_show,
                            color: Colors.black,
                            size: size != null
                                ? (size! / 3)
                                : iconSize != null
                                    ? iconSize
                                    : 20,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            })
        : Container(
            width: size ?? double.infinity,
            height: size ?? double.infinity,
            child: viewImage(false));
  }

  Widget viewImage(bool isHovered) {
    return Opacity(
      opacity: isHovered ? 0.5 : 1,
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: borderWith, color: Colors.blue)),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: image != null
                    ? Image(
                        width: size,
                        height: size,
                        image: image!,
                        fit: BoxFit.cover,
                      )
                    : url != null
                        ? ExtendedImage.network(
                            url!,
                            width: size != null ? size : double.infinity,
                            height: size != null ? size : double.infinity,
                            shape: BoxShape.circle,
                            fit: BoxFit.cover,
                            //cancelToken: cancellationToken,
                          )
                        : child ??
                            (defaultImage != null
                                ? Image(
                                    width: size,
                                    height: size,
                                    image: defaultImage!,
                                    fit: BoxFit.cover,
                                  )
                                : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
