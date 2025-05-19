import 'package:formz/formz.dart';

enum ValidationError { empty, tooShort }

class ValidatedString extends FormzInput<String, ValidationError> {
  final int minLength;

  const ValidatedString.pure({this.minLength = 0}) : super.pure('');
  const ValidatedString.dirty(super.value, {this.minLength = 0}) : super.dirty();

  @override
  ValidationError? validator(String value) {
    if (value.trim().isEmpty) {
      return ValidationError.empty;
    }
    if (value.trim().length < minLength) {
      return ValidationError.tooShort;
    }
    return null;
  }
}

String? multiValidator(String? value, List<String? Function(String?)> validators) {
  for (final validator in validators) {
    final result = validator(value);
    if (result != null) {
      return result;
    }
  }
  return null;
}

String? validatedStringValidator(String? value, {int minLength = 0}) {
  final input = ValidatedString.dirty(value ?? '', minLength: minLength);

  if (!input.isValid) {
    switch (input.error) {
      case ValidationError.empty:
        return 'Field is required';
      case ValidationError.tooShort:
        return 'Field must be at least $minLength characters';
      default:
        return null;
    }
  }
  return null;
}
