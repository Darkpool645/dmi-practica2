import 'package:flutter/material.dart';
import 'package:myapp/utils/toast_helper.dart';
import 'package:myapp/utils/validator.dart';
import 'package:myapp/widgets/custom_text_filed.dart';

class ForgotPasswordEmail extends StatefulWidget {
  const ForgotPasswordEmail({super.key});

  @override
  State<ForgotPasswordEmail> createState() => _ForgotPasswordEmailState();
}

class _ForgotPasswordEmailState extends State<ForgotPasswordEmail> {
  final TextEditingController _emailEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 200, height: 200),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailEditingController,
                  hintText: 'Correo electrónico',
                  labelText: 'Correo electrónico',
                  validator: Validators.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ToastHelper.showInfo(
                            context,
                            "Correo enviado. Ingresa el código para continuar",
                            'Correo verificado');
                        Navigator.pushNamed(context, '/verifyCode');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF07DFBC),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Enviar código'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
