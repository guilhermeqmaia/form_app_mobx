class UserValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return "O usuário deve ser preenchido";
    }
    if (value.length > 20) {
      return "O usuário não pode ter mais de 20 caracteres";
    }
    return null;
  }
}
