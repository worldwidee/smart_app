import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_app/smart_app.dart';



class PageState extends GetxController {
  Map<String, Widget> _pages = {};

  late String currentPage;
  List<String> pageQue = [];
  List<dynamic Function()> _disposeFuncs = [];
  dynamic _deliveringItem;

  get deliverinItem => _deliveringItem;

  set setDispose(dynamic Function() dispose) {
    _disposeFuncs.add(dispose);
  }

  PageState(AppPages pages) {
    _pages = pages.pages;
    currentPage = pages.initPage;
  }

  set setAppPages(AppPages pages) {
    _pages = pages.pages;
    currentPage = pages.initPage;
  }

  get pages => _pages;

  Future<void> disposeFunc() async {
    if (_disposeFuncs.isNotEmpty) {
      for (var func in _disposeFuncs) {
        await func();
      }
    }
    _disposeFuncs.clear();
  }

  Future<void> go({required String name, dynamic item}) async {
    if (name != currentPage) {
      _deliveringItem = item;
      pageQue.add(currentPage);
      currentPage = name;
      await disposeFunc();
      update();
    }
  }

  Future<bool> back() async {
    if (pageQue.isNotEmpty) {
      currentPage = pageQue.removeLast();
      await disposeFunc();
      update();
      return false;
    } else {
      return true;
    }
  }

  get page => _pages[currentPage];
}
