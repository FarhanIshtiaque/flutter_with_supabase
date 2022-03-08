import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_with_supabase/core/values/app_assets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_with_supabase/core/components/auth_state.dart';



class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends AuthState<SplashScreen>
    with SingleTickerProviderStateMixin {
  Timer? recoverSessionTimer;

  @override
  void initState() {
    super.initState();

    /// a timer to slow down session restore
    /// If not user can't really see the splash screen
    const _duration = Duration(seconds: 3);
    recoverSessionTimer = Timer(_duration, () {
      recoverSupabaseSession();
    });
  }

  /// on received auth deeplink, we should cancel recoverSessionTimer
  /// and wait for auth deep link handling result
  @override
  void onReceivedAuthDeeplink(Uri uri) {
    if (recoverSessionTimer != null) {
      recoverSessionTimer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SizedBox(
          height: 50.0,
          child: Lottie.asset(Assets.loader),
        ),
      ),
    );
  }
}