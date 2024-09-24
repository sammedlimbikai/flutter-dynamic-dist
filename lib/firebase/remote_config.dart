import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logger/logger.dart';

class MyAppRemoteConfig {
  static late FirebaseRemoteConfig _remoteConfig;
  static Logger log = Logger();
  static Future<void> initRemoteConfig() async {
    _remoteConfig = FirebaseRemoteConfig.instance;
    try {
      await _remoteConfig.setDefaults({
        'remote_data': 'No Data Available',
      });
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      log.log(Level.error, "unable to initialize remote config");
    }
  }

  static Future<String> getDistVersion() async {
    String distVersion = "";
    try {
      await _remoteConfig.fetchAndActivate();
      distVersion = _remoteConfig.getString("dist_version");
      return distVersion;
    } catch (e) {
      log.log(Level.error, "unable to initialize remote config");
      return distVersion;
    }
  }
}
