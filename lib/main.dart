import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dist_from_firebase/firebase/fire_storage.dart';
import 'package:flutter_dist_from_firebase/firebase/remote_config.dart';
import 'package:flutter_dist_from_firebase/firebase_options.dart';
import 'package:flutter_dist_from_firebase/pages/sample_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await MyAppRemoteConfig.initRemoteConfig();
  FireBaseStorage.getWebAppDist();
  String distVersion = await MyAppRemoteConfig.getDistVersion();
  if (kDebugMode) {
    print("dist version = $distVersion");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
