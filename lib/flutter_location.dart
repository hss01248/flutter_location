
import 'flutter_location_platform_interface.dart';

class FlutterLocation {
  Future<String?> getPlatformVersion() {
    return FlutterLocationPlatform.instance.getPlatformVersion();
  }

  Future<String?> getLocation() {

    return FlutterLocationPlatform.instance.getLocation();
  }
}
