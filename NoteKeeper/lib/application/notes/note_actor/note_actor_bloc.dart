import 'dart:async';

import 'package:NoteKeeper/domain/notes/i_note_repository.dart';
import 'package:NoteKeeper/domain/notes/note.dart';
import 'package:NoteKeeper/domain/notes/note_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';

@injectable
class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  final INoteRepository _noteRepository;

  NoteActorBloc(
    this._noteRepository,
  ) : super(const _Initial());

  @override
  Stream<NoteActorState> mapEventToState(
    NoteActorEvent event,
  ) async* {
    yield const NoteActorState.actionInProgress();
    final possibleFailure = await _noteRepository.delete(event.note);
    yield possibleFailure.fold(
      (noteFailure) => NoteActorState.deleteFailure(noteFailure),
      (_) => const NoteActorState.deleteSuccess(),
    );
  }
}
