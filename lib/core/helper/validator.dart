import 'package:get/get_utils/get_utils.dart';

class Validator {
 static String? validateEmail(String value) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);

    if (value.isEmpty) {
      return 'enter_an_email'.tr;
    } else if (!regExp.hasMatch(value)) {
      return 'enter_a_valid_email'.tr;
    } else {
      return null;
    }
  }


  static String? validatePassword(String value) {

    if (value.length < 7) {
      return 'password_must_be_at_least_7_characters_long'.tr;
    } else {
      return null;
    }
  }

 static String? numberValidator(String value) {
   if(value == null) {
     return null;
   }
   final n = num.tryParse(value);
   if(n == null) {
     return '"$value" is not a valid number';
   }
   return null;
 }

 static String? validateExpense(String value) {

   if (value.length < 1) {
     return 'Expense name can\'t be null';
   } else {
     return null;
   }
 }

}