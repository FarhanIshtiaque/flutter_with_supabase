import 'package:flutter_with_supabase/core/routes/app_routes.dart';
import 'package:flutter_with_supabase/view/screens/auth/login.dart';
import 'package:flutter_with_supabase/view/screens/auth/sign_up.dart';
import 'package:flutter_with_supabase/view/screens/home/home.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [

    GetPage(name: Routes.LOGIN, page:()=> Login(),),
    GetPage(name: Routes.SIGNUP, page:()=> SignUp()),


    GetPage(name: Routes.HOME, page:()=> Home()),
  ];
}