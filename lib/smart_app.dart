import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'states/app_colors.dart';
import 'states/app_fonts.dart';
import 'states/app_settings.dart';
import 'states/page_state.dart';

export 'states/app_colors.dart';
export 'states/app_fonts.dart';
export 'states/app_settings.dart';
export 'states/page_state.dart';
export 'states/smart_text.dart';
export 'widgets/sized_button.dart';
export 'widgets/smart_dialog.dart';
export 'widgets/checkbox_list.dart';
export 'widgets/textfield_chat.dart';
export 'widgets/expanded_container.dart';
export 'widgets/inf_container.dart';
export 'widgets/check_box.dart';
export 'widgets/child_expanded.dart';
export 'widgets/crop_image.dart';
export 'widgets/download_btn.dart';
export 'widgets/drop_down.dart';
export 'widgets/smart_textfield.dart';
export 'widgets/file_icon.dart';
export 'widgets/passwordfield.dart';
export 'widgets/file_type.dart';
export 'widgets/icon_of_file.dart';
export 'widgets/glass_morphism.dart';
export 'widgets/line_chart.dart';
export 'widgets/liquid_loading_bar.dart';
export 'widgets/middle_of_expanded.dart';
export 'widgets/radio_button_list.dart';
export 'widgets/region_bar.dart';
export 'widgets/expanded_text.dart';
export 'widgets/expanded_text_button.dart';
export 'variables.dart';
export 'widgets/profile_avatar.dart';
export 'widgets/image_avatar.dart';
export 'extensions/page_state.dart';
export 'extensions/string.dart';

class SmartApp {
  static Future<void> setup({
    AppAppearances? appearances,
    AppLanguages? languages,
    AppPages? pages,
  }) async {
    Get.put(AppSettings());
    if (languages != null) {
      Get.find<AppSettings>().setAppLanguages = languages;
    }
    Get.put(AppFonts());
    if (appearances != null) {
      Get.put(AppColors.withAppearances(appearances));
    }
    if (pages != null) {
      Get.put(PageState(pages));
    }
  }

  static AppColors setAppAppearances(AppAppearances appearances) {
    if (GetInstance().isRegistered<AppColors>()) {
      Get.find<AppColors>().setAppAppearances = appearances;
      return Get.find<AppColors>();
    } else {
      return Get.put(AppColors.withAppearances(appearances));
    }
  }

  static PageState setAppPages(AppPages pages) {
    if (GetInstance().isRegistered<PageState>()) {
      Get.find<PageState>().setAppPages = pages;
      return Get.find<PageState>();
    } else {
      return Get.put(PageState(pages));
    }
  }

  static AppSettings get appSettings => Get.find<AppSettings>();
  static AppFonts get appFonts => Get.find<AppFonts>();
  static AppColors get appColors => Get.find<AppColors>();
  static PageState get pageState => Get.find<PageState>();
}

class AppLanguages {
  List<String> languages;

  String initLanguge;
  AppLanguages({required this.languages, required this.initLanguge});
}

class AppAppearances {
  List<Appearance> appearances;

  Appearance initAppearance;
  AppAppearances({required this.appearances, required this.initAppearance});
}

class AppPages {
  Map<String, Widget> pages;

  String initPage;

  AppPages({required this.pages, required this.initPage});
}

class SmartPage extends StatelessWidget {
  const SmartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageState>(
      builder: (controller) {
        return controller.page;
      },
    );
  }
}
