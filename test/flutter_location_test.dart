import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_location/flutter_location.dart';
import 'package:flutter_location/flutter_location_platform_interface.dart';
import 'package:flutter_location/flutter_location_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLocationPlatform 
    with MockPlatformInterfaceMixin
    implements FlutterLocationPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterLocationPlatform initialPlatform = FlutterLocationPlatform.instance;

  test('$MethodChannelFlutterLocation is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterLocation>());
  });

  test('getPlatformVersion', () async {
    FlutterLocation flutterLocationPlugin = FlutterLocation();
    MockFlutterLocationPlatform fakePlatform = MockFlutterLocationPlatform();
    FlutterLocationPlatform.instance = fakePlatform;
  
    expect(await flutterLocationPlugin.getPlatformVersion(), '42');
  });
}
