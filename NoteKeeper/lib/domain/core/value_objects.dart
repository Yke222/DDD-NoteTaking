import 'package:NoteKeeper/domain/core/errors.dart';
import 'package:NoteKeeper/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Get identical value [id], else Throws [UnexpectedValueError] containing the [ValueFailure].
  T getOrCrash() {
    // id = indetity, meaning that it will return the same value as (right) => right;
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ValueObject(value: $value)';
}
