import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void Function() updateState(State state) {
  return () {
    state.setState(() {});
  };
}
void connectionListen(void Function(bool status) func) {
  InternetConnectionChecker().onStatusChange.listen((status) async {
    switch (status) {
      case InternetConnectionStatus.connected:
        func(true);
        break;
      case InternetConnectionStatus.disconnected:
        func(false);
        break;
    }
  });
}
