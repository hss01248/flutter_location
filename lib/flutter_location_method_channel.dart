import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_location_platform_interface.dart';

/// An implementation of [FlutterLocationPlatform] that uses method channels.
class MethodChannelFlutterLocation extends FlutterLocationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_location');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getLocation() async{
    final version2 = await methodChannel.invokeMethod<String>('getLocation',{"isSilent":false,"timeout":10000});
    return version2;
  }
}
