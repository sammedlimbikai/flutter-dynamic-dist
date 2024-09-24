import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:logger/logger.dart';

class MyAppRemoteConfig {
  late FirebaseRemoteConfig _remoteConfig;
  Logger log = Logger();
  Future<void> fetchRemoteConfig() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await _remoteConfig.setDefaults({
        'dist_version': '0.0.0(0)',
      });
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      log.log(Level.error, "unable to initialize remote config");
    }
  }
}
