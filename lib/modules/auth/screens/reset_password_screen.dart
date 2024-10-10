import 'package:flutter/material.dart';
import 'package:myapp/utils/toast_helper.dart';
import 'package:myapp/utils/validator.dart';
import 'package:myapp/widgets/custom_text_filed.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _newPasswordEditingController =
      TextEditingController();
  final TextEditingController _newPasswordReplicationEditingController =
      TextEditingController();
  final _fomrKey = GlobalKey<FormState>();

  bool _isObscureNewPassword = true;
  bool _isObscureReplyPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _fomrKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 200, height: 200),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _newPasswordEditingController,
                    hintText: 'Contraseña',
                    labelText: 'Contraseña',
                    validator: Validators.validatePassword,
                    obscureText: _isObscureNewPassword,
                    suffixIcon: IconButton(
                        icon: Icon(_isObscureNewPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscureNewPassword = !_isObscureNewPassword;
                          });
                        }),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: _newPasswordReplicationEditingController,
                    hintText: 'Confirmar Contraseña',
                    labelText: 'Confirmar Contraseña',
                    validator: (value) => Validators.validateConfirmPassword(value, _newPasswordEditingController.text),
                    obscureText: _isObscureReplyPassword,
                    suffixIcon: IconButton(
                      icon: Icon(_isObscureReplyPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscureReplyPassword = !_isObscureReplyPassword;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_fomrKey.currentState!.validate()) {
                          ToastHelper.showSuccess(
                              context, "Contraseña actualizada. Inicia sesión");
                          Navigator.pushNamed(context, '/');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF07DFBC),
                          foregroundColor: Colors.white),
                      child: const Text('Actualizar contraseña'),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
