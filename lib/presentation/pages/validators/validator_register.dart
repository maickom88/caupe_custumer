import 'package:flux_validator_dart/flux_validator_dart.dart';

class Validators {
  static String? validateName(String value, bool startValidade) {
    if (value.isEmpty && startValidade) {
      return 'Campo obrigatório';
    }
  }

  static String? validateEmail(String value, bool startValidade) {
    if (value.isEmpty && startValidade) {
      return 'Campo obrigatório';
    }
    if (Validator.email(value) && startValidade) {
      return 'Digite um email válido';
    }
  }

  static String? validatePassword(String value, bool startValidade) {
    if (value.isEmpty && startValidade) {
      return 'Campo obrigatório';
    }
    if (!value.contains(new RegExp(r'[0-9]')) && startValidade) {
      return 'Sua senha deve possuir números';
    }
    if (value.length < 8 && startValidade) {
      return 'Senha tem que possuir mais de 8 caracteres';
    }
  }

  static String? validateDocument(String value, bool startValidade) {
    if (value.isEmpty && startValidade) {
      return 'Campo obrigatório';
    }
    if (!value.contains('/')) {
      if (Validator.cpf(value) && startValidade) {
        return 'Digite um CPF ou CNPJ válido!';
      }
    }
    if (value.contains('/')) {
      if (Validator.cnpj(value) && startValidade) {
        return 'Digite um CPF ou CNPJ válido!';
      }
    }
  }
}
