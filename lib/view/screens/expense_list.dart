import 'package:flutter/material.dart';
import 'package:flutter_with_supabase/controller/expense_controller.dart';
import 'package:flutter_with_supabase/core/components/auth_required_state.dart';
import 'package:get/get.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends AuthRequiredState<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    final expenseController = Get.put(ExpenseController());
    return Scaffold(
       body:Obx(
           ()=> ListView.builder(
           itemCount: expenseController.expenseList.length,
           itemBuilder: (context,index){

             return Row(
               children: [
                 Text(expenseController.expenseList[index]['expense_name']),
                 Text(expenseController.expenseList[index]['amount'].toString()),
               ],
             );
           }
         ),
       ),
    );
  }
}
