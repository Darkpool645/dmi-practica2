import 'package:flutter/material.dart';
import 'package:myapp/utils/toast_helper.dart';
import 'package:myapp/utils/validator.dart';
import 'package:myapp/widgets/custom_text_filed.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

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
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordEditingController,
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  validator: Validators.validatePassword,
                  obscureText: _isObscure,
                  suffixIcon: IconButton(
                      icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      }),
                ),
                const SizedBox(height: 48),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ToastHelper.showSuccess(
                            context, "Inicio de sesión exitoso");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF07DFBC),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Iniciar sesión'),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotPasswordEmail');
                    },
                    child: const Text('Recuperar Contraseña',
                        style:
                            TextStyle(decoration: TextDecoration.underline))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
