class InputValidator {
  static bool isValidEmail(String email) {
    // Regular expression untuk validasi email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!isValidEmail(value)) {
      return 'Format email tidak valid';
    }
    return null;
  }

  static bool isValidPassword(String password) {
    // Minimal 6 karakter
    if (password.length < 6) return false;

    // Minimal 2 huruf kapital
    final upperCaseLetters = RegExp(r'[A-Z]').allMatches(password);
    if (upperCaseLetters.length < 2) return false;

    return true;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    
    final upperCaseLetters = RegExp(r'[A-Z]').allMatches(value);
    if (upperCaseLetters.length < 2) {
      return 'Password harus memiliki minimal 2 huruf kapital';
    }
    
    return null;
  }
}
