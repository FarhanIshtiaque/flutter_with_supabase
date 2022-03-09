import 'package:flutter/material.dart';
import 'package:flutter_with_supabase/controller/expense_controller.dart';
import 'package:flutter_with_supabase/core/components/auth_required_state.dart';
import 'package:flutter_with_supabase/view/widgets/buttons/button.dart';
import 'package:get/get.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}
ExpenseController expenseController = Get.find();
class _ExpenseListState extends AuthRequiredState<ExpenseList> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Expense List'),
        centerTitle: true,

      ),
       body:Obx(
           ()=> ListView.builder(
           itemCount: expenseController.expenseList.length,
           itemBuilder: (context,index){

             return Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.deepPurpleAccent,
                   borderRadius: BorderRadius.circular( 20 )
                 ),

                 child: Padding(
                   padding: const EdgeInsets.all(10.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Expense Name: "+expenseController.expenseList[index]['expense_name']),
                           const SizedBox(height: 10,),
                           Text("Amount: "+expenseController.expenseList[index]['amount'].toString()),
                         ],
                       ),
                       SizedBox(
                         width: 80,
                         child: ButtonCustom(onPressed:()async{
                         expenseController.expenseId = await expenseController.expenseList[index]['id'];
                         print(expenseController.expenseId);

                         Navigator.pushNamed(context, '/expenseUpdate',);


                         }, buttonName: Text('Update')),
                       ),
                       SizedBox(
                         width: 80,
                         child: ButtonCustom(onPressed:(){

                           print('amount');
                           print(expenseController.expenseList[index]['amount']);
                           expenseController.deleteExpense(expenseController.expenseList[index]['amount']);


                         }, buttonName: Text('Delete')),
                       )
                     ],
                   ),
                 ),
               ),
             );
           }
         ),
       ),
    );
  }
}
