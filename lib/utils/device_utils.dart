import 'dart:collection';
import 'package:device_info/device_info.dart';
import 'package:imei_plugin/imei_plugin.dart';
import 'package:package_info/package_info.dart';

Future<AndroidDeviceInfo> _deviceInfo() async{
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      return await deviceInfo.androidInfo;
  }
Future<String> imeiCode() async{
   var imei;
               try{
               imei = await ImeiPlugin.getImei;
               }catch(e){
                 print(e);
               }
      return imei.toString();
  }

Future<String> appVersionName() async{
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
}

Future<String> deviceType() async{
     HashMap<String, bool> mSupportedDevicelist;
     mSupportedDevicelist = new HashMap<String, bool>();
    mSupportedDevicelist.putIfAbsent("SM-T116IR", ()=> true);

String deviceUsed = "";
  final deviceInfo = await _deviceInfo();
  String devicename = deviceInfo.model;
    if (mSupportedDevicelist.containsKey(devicename) == null){
      deviceUsed = "mobile";
    }else{
      deviceUsed = "tab";
    }
  return deviceUsed;
}
