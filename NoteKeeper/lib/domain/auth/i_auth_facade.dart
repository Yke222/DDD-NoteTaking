import 'package:NoteKeeper/domain/auth/auth_failure.dart';
import 'package:NoteKeeper/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/cupertino.dart';

/// FirebaseAuth, GoogleSignIn

/// Dart doesn't use Interfaces, so in order to simulate the same behavior, we
/// will be using [Facades].
abstract class IAuthFacade {
  /// Register with provided [emailAdress] and [password].
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAdress emailAdress,
    @required Password password,
  });

  /// Sign in with provided [emailAdress] and [password].
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAdress emailAdress,
    @required Password password,
  });

  // Google sign in, no parameters needed.
  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
