import 'package:NoteKeeper/domain/core/failures.dart';
import 'package:NoteKeeper/domain/core/value_objects.dart';
import 'package:NoteKeeper/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class EmailAdress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAdress(String input) {
    assert(input != null);
    return EmailAdress._(
      validateEmailAddress(input),
    );
  }

  const EmailAdress._(this.value);
}

class Pasword extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Pasword(String input) {
    assert(input != null);
    return Pasword._(
      validatePassword(input),
    );
  }

  const Pasword._(this.value);
}
