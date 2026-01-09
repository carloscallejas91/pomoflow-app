import 'package:get/get.dart';

class AppValidators {
  AppValidators._();

  static final _lowerCaseRegex = RegExp(r'[a-z]');
  static final _upperCaseRegex = RegExp(r'[A-Z]');
  static final _digitRegex = RegExp(r'[0-9]');
  static final _specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  static String? email(String? value) {
    final emptyError = notEmpty(
      value,
      message: 'O campo de e-mail é obrigatório.',
    );
    if (emptyError != null) return emptyError;

    if (!GetUtils.isEmail(value!.trim())) {
      return 'Por favor, insira um e-mail válido.';
    }
    return null;
  }

  static String? strongPassword(String? value) {
    final emptyError = notEmpty(
      value,
      message: 'O campo de senha é obrigatório.',
    );
    if (emptyError != null) return emptyError;

    if (value!.length < 8) {
      return 'A senha deve ter no mínimo 8 caracteres.';
    }

    if (!_lowerCaseRegex.hasMatch(value)) {
      return 'Deve conter pelo menos uma letra minúscula.';
    }

    if (!_upperCaseRegex.hasMatch(value)) {
      return 'Deve conter pelo menos uma letra maiúscula.';
    }

    if (!_digitRegex.hasMatch(value)) {
      return 'Deve conter pelo menos um número.';
    }

    if (!_specialCharRegex.hasMatch(value)) {
      return 'Deve conter pelo menos um caractere especial.';
    }

    return null;
  }

  static String? password(String? value) {
    final emptyError = notEmpty(
      value,
      message: 'O campo de senha é obrigatório.',
    );
    if (emptyError != null) return emptyError;

    if (value!.length < 8) {
      return 'A senha deve ter pelo menos 8 caracteres.';
    }

    return null;
  }

  static String? confirmPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'A confirmação de senha é obrigatória.';
    }
    if (password != confirmPassword) {
      return 'As senhas não coincidem.';
    }
    return null;
  }

  static String? notEmpty(String? value, {String? message}) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'Este campo é obrigatório.';
    }
    return null;
  }
}
