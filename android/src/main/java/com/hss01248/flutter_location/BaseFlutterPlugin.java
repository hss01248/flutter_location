package com.hss01248.flutter_location;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @Despciption todo
 * @Author hss
 * @Date 30/08/2022 11:22
 * @Version 1.0
 */
public abstract class BaseFlutterPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler {

    private MethodChannel channel;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), getChannelName());
        channel.setMethodCallHandler(this);
    }

    protected abstract String getChannelName();

    protected Map<String,MethodChannel.Result> resultMap = new HashMap<>();
    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        if (call.method.equals("getLocation")) {
            Map<String, Object> arguments = (Map<String, Object>) call.arguments;
        }
        resultMap.put(result.toString(),result);
       // getLocation();


    }

    protected  void  getLocation(String arguments,String callbackName){
        resultMap.remove(callbackName).success(null);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        resultMap.clear();
    }
}
