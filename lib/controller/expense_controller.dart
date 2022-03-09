import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExpenseController extends GetxController{
  var isLoading = false.obs;
  // List expenseList = [].obs;
  final expenseList = <dynamic>[].obs;






  Future<dynamic> fetchExpense() async {
    try{
      isLoading(true);
      var response = await Supabase.instance.client.from('expense_info').select(
        'expense_name,amount'
      ).order('created_at').execute();
      if (response.error != null) {
        isLoading(false);
        Get.snackbar('Opps', response.error!.message);
      } else {
        /// Sign in with success
        isLoading(false);
        expenseList.value = response.data;
        update();



        Get.snackbar('Data Updated Successfully', response.data.toString());
        return expenseList;

      }
    }
    finally{
      isLoading(false);
    }
  }
}