mixin ValidationMixin {
  String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Password cannot be empty';
    }
    if (value!.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Email cannot be empty';
    }
    if (!value!.contains('@')) {
      return 'Please enter a valid email!';
    }
    return null;
  }
}
