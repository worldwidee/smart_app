import 'dart:io';

import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';

class VideoPlayerDesktop extends StatefulWidget {
  String path;
  double? width, height;
  VideoPlayerDesktop({Key? key, required this.path, this.width, this.height})
      : super(key: key);

  @override
  State<VideoPlayerDesktop> createState() => _VideoPlayerDesktopState(path);
}

class _VideoPlayerDesktopState extends State<VideoPlayerDesktop> {
  late Player player;
  _VideoPlayerDesktopState(String path) {
    player = Player(id: 69420);
    player.open(
      Media.file(File(path)),
      autoStart: false, // default
    );
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: Video(
        player: player,
        width: widget.width == null ? double.infinity : widget.width,
        height: widget.height == null ? double.infinity : widget.height,
        fit: BoxFit.contain,
        volumeThumbColor: Colors.blue,
        volumeActiveColor: Colors.blue,
        showTimeLeft: true,
      ),
    );
  }
}
