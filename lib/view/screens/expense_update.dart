
import 'package:flutter/material.dart';
import 'package:flutter_with_supabase/controller/expense_controller.dart';
import 'package:flutter_with_supabase/controller/home_controller.dart';
import 'package:flutter_with_supabase/core/components/auth_required_state.dart';
import 'package:flutter_with_supabase/core/helper/validator.dart';
import 'package:flutter_with_supabase/view/widgets/buttons/button.dart';
import 'package:flutter_with_supabase/view/widgets/text_field/textfield_custom.dart';
import 'package:get/get.dart';

class ExpenseUpdate extends StatefulWidget {
  const ExpenseUpdate({Key? key}) : super(key: key);

  @override
  State<ExpenseUpdate> createState() => _ExpenseUpdateState();
}

class _ExpenseUpdateState extends AuthRequiredState<ExpenseUpdate> {

  final expenseController = TextEditingController();
  final amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    expenseController.dispose();
    amountController.dispose();
  }

ExpenseController ec = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldCustom(
                  labelText: 'Expense Name',
                  controller: expenseController,
                  validator: (v)=>Validator.validateExpense(v!),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldCustom(
                  labelText: 'Amount',
                  validator: (v) => Validator.numberValidator(v!),
                  controller: amountController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonCustom(onPressed: () {
                  final isValid = formKey.currentState!.validate();
                  if (isValid) {
                    ec.updateExpense(value: ec.expenseId, amount: expenseController.text.trim(),);

                  }
                  expenseController.clear();
                  amountController.clear();
                  FocusScopeNode currentFocus = FocusScope.of(context);

                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                }, buttonName: Text('Update Expense')),


              ],
            ),
          )
      ),
    );
  }
}
