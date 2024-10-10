class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo es obligatorio';
    }

    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Ingrese un correo válido';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'La contraseña es obligatoria';
    }

    String pattern = r'^[a-zA-Z0-9]{8,}';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'La contraseña debe tener al menos 8 caracteres alfanuméricos';
    }
    return null;
  }

  static String? validateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'El código es obligatorio';
    }

    String pattern = r'^\d{6}';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'El código debe tener exactamente 6 números';
    }
    return null;
  }

   static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirma la contraseña';
    }
    if (value != password) {
      return 'Las contraseñas no coinciden';
    }
    return null;
  }
}
