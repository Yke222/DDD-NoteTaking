import 'package:NoteKeeper/domain/core/failures.dart';
import 'package:NoteKeeper/domain/core/value_objects.dart';
import 'package:NoteKeeper/domain/notes/todo_item.dart';
import 'package:NoteKeeper/domain/notes/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'note.freezed.dart';

@freezed
abstract class Note implements _$Note {
  // ignore: unused_element
  const Note._();

  const factory Note({
    @required UniqueId id,
    @required NoteBody body,
    @required NoteColor color,
    @required List3<TodoItem> todos,
  }) = _Note;

  /// Default empty note.
  factory Note.empty() => Note(
        id: UniqueId(),
        body: NoteBody(''),
        color: NoteColor(NoteColor.predefinedColors[0]),
        todos: List3(emptyList()),
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(todos.failureOrUnit)
        .andThen(
          todos
              .getOrCrash()

              /// Getting the failureOption from the TodoItem ENTITY - NOT a failureOrUnit from a VALUE OBJECT.
              .map((todoItem) => todoItem.failureOption)
              .filter((option) => option.isSome())

              /// If we can't get the 0th element, that means the list is empty, in that case being valid.
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (failure) => left(failure)),
        )
        .fold((failure) => some(failure), (_) => none());
  }
}
