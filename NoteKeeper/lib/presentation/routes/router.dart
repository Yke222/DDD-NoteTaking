import 'package:NoteKeeper/presentation/sign_in/sign_in_page.dart';
import 'package:NoteKeeper/presentation/splash/splash_page.dart';
import 'package:auto_route/auto_route_annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
  ],
  generateNavigationHelperExtension: true,
)
class $Router {}
