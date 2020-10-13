import 'package:flutter/cupertino.dart';

class EmailAdress {
  final String value;

  factory EmailAdress(String input) {
    assert(input != null);
    return EmailAdress._(
      validateEmailAddress(input),
    );
  }

  const EmailAdress._(this.value);

  @override
  String toString() => 'EmailAdress(value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is EmailAdress && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;
}

String validateEmailAddress(String input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(emailRegex).hasMatch(input)) {
    return input;
  } else {
    throw InvaliEmailException(failedValue: input);
  }
}

class InvaliEmailException implements Exception {
  final String failedValue;

  InvaliEmailException({@required this.failedValue});
}
