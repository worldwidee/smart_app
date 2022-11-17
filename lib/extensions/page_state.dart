
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../states/page_state.dart';

extension PageContext on BuildContext {
  Future<void> go({required String name, dynamic item}) async {
    await Get.find<PageState>().go(name: name, item: item);
  }
}