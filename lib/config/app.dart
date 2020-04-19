import 'package:codex_test/config/router.dart';
import 'package:codex_test/core/bloc/bloc/story_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoryBloc>(
        create: (context) => StoryBloc(),
        child: MaterialApp(
        title: 'Codex',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF660066),
          accentColor: Color(0xFFba6cba)
        ),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}