import 'package:flutter/material.dart';
import 'package:myapp/modules/auth/screens/forgot_password_email_screen.dart';
import 'package:myapp/modules/auth/screens/login_screen.dart';
import 'package:myapp/modules/auth/screens/reset_password_screen.dart';
import 'package:myapp/modules/auth/screens/verify_code_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>const Login(),
        '/forgotPasswordEmail': (context) => const ForgotPasswordEmail(),
        '/verifyCode': (context) => const VerifyCode(),
        '/resetPassword': (context) => const ResetPassword()
      },
    );
  }
}


// Free Sci-Fi Office Pack
