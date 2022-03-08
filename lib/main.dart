import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_with_supabase/configure_app.dart';

import 'package:flutter_with_supabase/core/routes/app_pages.dart';
import 'package:flutter_with_supabase/view/screens/auth/login.dart';
import 'package:get/get.dart';

import 'core/language/translator.dart';

Future<void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Translator(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en','US'),
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),

    );
  }
}


