import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/routes/routes.dart';
import 'configs/themes/app_themes.dart';
import 'firebase_options.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI TECH 365',
      theme: AppThemes.appTheme,
      darkTheme: ThemeData.light(),
      themeMode: ThemeMode.light,
      getPages: Routes.route,
      initialRoute: Routes.initialRoute,
    );
  }
}

