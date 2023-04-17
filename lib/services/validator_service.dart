abstract class IValidatorService {
  String? validateEmail(String? email);
  String? validatePassword(String? password);
}

class ValidatorServiceImpl implements IValidatorService {
  @override
  String? validateEmail(String? email) {
    if (email != null) {
      final emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);

      if (!emailValid) {
        return "Неверно введен email";
      } else {
        return null;
      }
    }
    return null;
  }

  @override
  String? validatePassword(String? password) {
    if (password != null) {
      if (password.length < 6) {
        return "Длина пароля не должна быть меньше 6";
      } else {
        return null;
      }
    }
    return null;
  }
}
