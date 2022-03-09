import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_with_supabase/configure_app.dart';
import 'package:flutter_with_supabase/view/screens/auth/login.dart';
import 'package:flutter_with_supabase/view/screens/auth/sign_up.dart';
import 'package:flutter_with_supabase/view/screens/expense_list.dart';
import 'package:flutter_with_supabase/view/screens/expense_update.dart';
import 'package:flutter_with_supabase/view/screens/home/home.dart';
import 'package:flutter_with_supabase/view/screens/splash_screen.dart';
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
      onGenerateRoute:generateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/login': (_) => Login(),
        '/signUp': (_) => SignUp(),
        '/home': (_) => Home(),
        '/expenseList': (_) => ExpenseList(),
        '/expenseUpdate': (_) => ExpenseUpdate(),
      },

    );


  }

}


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return MaterialPageRoute(
          builder: (_) => kIsWeb ? SplashScreen() : SplashScreen());
  }
}