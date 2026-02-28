class ValidationUtils {
  static bool isValidPhoneNumber(String number) {
    final phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$');
    return phoneRegExp.hasMatch(number);
  }

  static int parseInt(String value) {
    return int.tryParse(value) ?? 0;
  }
}
