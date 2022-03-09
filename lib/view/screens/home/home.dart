import 'package:flutter/material.dart';
import 'package:flutter_with_supabase/controller/expense_controller.dart';
import 'package:flutter_with_supabase/controller/home_controller.dart';
import 'package:flutter_with_supabase/core/components/auth_required_state.dart';
import 'package:flutter_with_supabase/core/helper/validator.dart';
import 'package:flutter_with_supabase/view/widgets/buttons/button.dart';
import 'package:flutter_with_supabase/view/widgets/text_field/textfield_custom.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends AuthRequiredState<Home> {
  final expenseController = TextEditingController();
  final amountController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final homeController = Get.put(HomeController());
  final expenseState = Get.put(ExpenseController());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    expenseController.dispose();
    amountController.dispose();
  }


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
                  homeController.addExpense(expanseName: expenseController.text, amount: amountController.text.trim());

                }
                expenseController.clear();
                amountController.clear();
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              }, buttonName: Text('Add Expense')),

              const SizedBox(
                height: 20,
              ),
              ButtonCustom(onPressed: () {
                expenseState.fetchExpense();


                Navigator.pushNamed(context, '/expenseList',);
              }, buttonName: Text('Expense List'))

            ],
          ),
        )
      ),
    );
  }
}
