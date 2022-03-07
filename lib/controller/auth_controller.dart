import 'package:flutter_with_supabase/core/routes/app_routes.dart';
import 'package:flutter_with_supabase/core/values/app_constants.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class AuthController extends GetxController{


  var isLoading = false.obs;


  Future<void> signIn({required String email, required String password}) async {
     try{
       isLoading(true);
       final response = await Supabase.instance.client.auth.signIn(email: email, password: password);
       if (response.error != null) {
         isLoading(false);
         Get.snackbar('Opps', response.error!.message);
       } else {
         /// Sign in with success
         isLoading(false);
         logger.d(response.data);
         Get.toNamed(Routes.HOME);
         Get.snackbar('Successful', response.data!.user!.email.toString());
       }
     }
     finally{
       isLoading(false);
    }
  }


  Future<void> signUp({required String email, required String password}) async {
    try{
      isLoading(true);
      GotrueSessionResponse response = await Supabase.instance.client.auth.signUp(email,password);
      if (response.error != null) {
        isLoading(false);
        Get.snackbar('Opps', response.error!.message);
      } else {
        /// Sign in with success
        isLoading(false);
        Get.toNamed(Routes.HOME);
        Get.snackbar('Login Successful', response.data!.user!.email.toString());
      }
    }
    finally{
      isLoading(false);
    }
  }



}