class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "A senha deve ser preenchido";
    }
    if (value.length < 2) {
      return "A senha não pode ter menos que dois caracteres";
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return "A senha não pode ter caracteres especiais";
    }
    if (value.length > 20) {
      return "A senha não pode ter mais de 20 caracteres";
    }

    return null;
  }
}
