import 'package:NoteKeeper/application/auth/auth_bloc.dart';
import 'package:NoteKeeper/presentation/sign_in/sign_in_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';

import '../routes/router.gr.dart' as router;

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp(
        title: 'Notes',
        home: SignInPage(),
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator<router.Router>(router: router.Router()),
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.green[800],
            accentColor: Colors.blueAccent,
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            )),
      ),
    );
  }
}
