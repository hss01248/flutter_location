package com.hss01248.flutter_location;

import android.location.Location;

import androidx.annotation.NonNull;

import com.blankj.utilcode.util.Utils;
import com.google.gson.Gson;
import com.hss01248.location.LocationInfo;
import com.hss01248.location.LocationSync;
import com.hss01248.location.LocationUtil;
import com.hss01248.location.MyLocationCallback;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** FlutterLocationPlugin */
public class FlutterLocationPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "flutter_location");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } if (call.method.equals("getLocation")) {
      //result.success("Android " + android.os.Build.VERSION.RELEASE);
      LocationUtil.getLocation(Utils.getApp(),
              call.argument("isSilent")
              ,call.argument("timeout"),
              false, true,
              new MyLocationCallback() {

                @Override
                public void onSuccess(Location location, String msg) {
                    LocationInfo locationInfo = LocationSync.toLocationInfo(location);
                    result.success(new Gson().toJson(locationInfo));
                }

                  @Override
                  public void onFailed(int type, String msg, boolean isFailBeforeReallyRequest) {
                      result.error(type+"",msg,"isFailBeforeReallyRequest:"+isFailBeforeReallyRequest);
                  }
              });
    }else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
