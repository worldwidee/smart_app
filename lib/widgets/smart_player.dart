import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_app/smart_app.dart';
import 'videoPlayerDesktop.dart';
import 'video_player_mobile.dart';

class SmartPlayer extends StatelessWidget {
  String path;
  double? width, height;
  SmartPlayer({Key? key, required this.path, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartAppPanel.appSettings.isDesktop
        ? VideoPlayerDesktop(path: path, width: width, height: height)
        : VideoPlayerMobile(path: path, width: width, height: height);
  }
}
