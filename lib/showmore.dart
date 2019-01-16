import 'dart:async';

import 'package:flutter/services.dart';

class Showmore {
  static const MethodChannel _channel =
      const MethodChannel('showmore');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
