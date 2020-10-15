part of 'sign_in_form_bloc.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    @required EmailAdress emailAdress,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmiting,
    @required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAdress: EmailAdress(''),
        password: Password(''),
        showErrorMessages: false,
        isSubmiting: false,
        authFailureOrSuccessOption: none(),
      );
}
