mixin LoginMixin {
  String? validatePassword(value) {
    value = value ?? "";
    value = value.replaceAll(" ", "");
    if (value.length < 8) {
      return "Debe tener más de 8 caracteres";
    }

    return null;
  }

  String? validateEmail(value) {
    value ??= "";
    value = value.replaceAll(" ", "");
    final bool isValid = RegExp(
      r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",
    ).hasMatch(value);
    return !isValid ? "Email Invalido" : null;
  }
}
