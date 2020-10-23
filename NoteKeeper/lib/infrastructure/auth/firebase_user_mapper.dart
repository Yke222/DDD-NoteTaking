import 'package:NoteKeeper/domain/auth/user.dart';
import 'package:NoteKeeper/domain/core/value_objects.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomainX on User {
  LocalUser toDomain() {
    return LocalUser(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
