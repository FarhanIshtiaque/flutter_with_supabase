import 'package:flutter/material.dart';
import 'package:flutter_with_supabase/controller/auth_controller.dart';
import 'package:flutter_with_supabase/core/helper/validator.dart';
import 'package:flutter_with_supabase/core/values/app_assets.dart';
import 'package:flutter_with_supabase/view/widgets/buttons/button.dart';
import 'package:flutter_with_supabase/view/widgets/text_field/textfield_custom.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();

}
class _SignUpState extends State<SignUp> {
final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('sign_up'.tr),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text("English"),
                  onTap: () {
                    var locale = const Locale('en', 'US');
                    Get.updateLocale(locale);
                  },
                ),
                PopupMenuItem(
                  child: const Text("Danish"),
                  onTap: () {
                    var locale = const Locale('dn', 'DK');
                    Get.updateLocale(locale);
                  },
                )
              ])
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldCustom(
                labelText: 'login'.tr,
                validator: (v) => Validator.validateEmail(v!),
                controller: usernameController,
              ),
              TextFieldCustom(
                labelText: 'password'.tr,
                validator: (v) => Validator.validatePassword(v!),
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(
                    () => ButtonCustom(
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();
                    if (isValid) {
                      authController.signUp(
                          email: usernameController.text.trim(),
                          password: passwordController.text.trim());
                    }
                  },
                  buttonName: authController.isLoading.value
                      ? Lottie.asset(Assets.loader, width: 35)
                      : Text(
                    'sign_up'.tr,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
