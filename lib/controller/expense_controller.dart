import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExpenseController extends GetxController {
  var isLoading = false.obs;

  // List expenseList = [].obs;
  final expenseList = <dynamic>[].obs;
  var index = 0;







  Future<dynamic> fetchExpense() async {
    try {
      isLoading(true);
      var response = await Supabase.instance.client
          .from('expense_info')
          .select('expense_name,amount,id')
          .order('created_at', ascending: true)
          .execute();
      if (response.error != null) {
        isLoading(false);
        Get.snackbar('Opps', response.error!.message);
      } else {
        /// Sign in with success
        isLoading(false);
        expenseList.value = response.data;

        return expenseList;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<dynamic> deleteExpense(int value) async {
    try {
      isLoading(true);
      var response = await Supabase.instance.client
          .from('expense_info')
          .delete()
          .eq('amount', value)
          .execute();
      if (response.error != null) {
        isLoading(false);
        Get.snackbar('Opps', response.error!.message);
      } else {
        /// Sign in with success
        isLoading(false);
        expenseList.removeAt(index);

      }
    } finally {
      isLoading(false);
    }
  }




  int expenseId = 0;



  Future<dynamic> updateExpense({required int value, required String amount }) async {
    try {
      isLoading(true);
      var response = await Supabase.instance.client
          .from('expense_info')
          .update({ 'amount': amount})
          .eq('id', value)
          .execute();
      if (response.error != null) {
        isLoading(false);
        Get.snackbar('Opps', response.error!.message);
      } else {
        /// Sign in with success
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }



}
