import 'package:NoteKeeper/domain/core/failures.dart';
import 'package:NoteKeeper/domain/core/value_objects.dart';
import 'package:NoteKeeper/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';

class EmailAdress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAdress(String input) {
    assert(input != null);
    return EmailAdress._(
      validateEmailAddress(input),
    );
  }

  const EmailAdress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}
