import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;

  Future<void> addExpense({required String expanseName, required String amount}) async {
    try{
      isLoading(true);
      var response = await Supabase.instance.client.from('expense_info').insert({
        'expense_name': expanseName,
        'amount': amount,
       }).execute();
      if (response.error != null) {
        isLoading(false);
        Get.snackbar('Opps', response.error!.message);
      } else {
        /// Sign in with success
        isLoading(false);

        Get.snackbar('Data Updated Successfully', response.data.toString());
      }
    }
    finally{
      isLoading(false);
    }
  }
}