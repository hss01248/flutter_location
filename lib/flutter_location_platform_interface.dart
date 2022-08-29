import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_location_method_channel.dart';

abstract class FlutterLocationPlatform extends PlatformInterface {
  /// Constructs a FlutterLocationPlatform.
  FlutterLocationPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterLocationPlatform _instance = MethodChannelFlutterLocation();

  /// The default instance of [FlutterLocationPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterLocation].
  static FlutterLocationPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterLocationPlatform] when
  /// they register themselves.
  static set instance(FlutterLocationPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getLocation() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
