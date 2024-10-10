import 'package:flutter/material.dart';
import 'package:myapp/utils/toast_helper.dart';
import 'package:myapp/utils/validator.dart';
import 'package:myapp/widgets/custom_text_filed.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final TextEditingController _codeEditingController = TextEditingController();
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
                  controller: _codeEditingController,
                  hintText: 'Código de seguridad',
                  labelText: 'Código de seguridad',
                  validator: Validators.validateCode,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      ToastHelper.showSuccess(context,
                          "El código es correcto. Actualiza la contraseña");
                      Navigator.pushNamed(context, '/resetPassword');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF07DFBC),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Validar código'),
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
