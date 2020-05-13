import 'package:codex_test/config/router.dart';
import 'package:codex_test/core/bloc/comment/comment_bloc.dart';
import 'package:codex_test/core/bloc/favorit/favorit_bloc.dart';
import 'package:codex_test/core/bloc/story/story_bloc.dart';
import 'package:codex_test/core/provider/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartModel>(create: (_) => CartModel()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StoryBloc>(create: (context) => StoryBloc()),
          BlocProvider<FavoritBloc>(create: (context) => FavoritBloc()),
          BlocProvider<CommentBloc>(create: (context) => CommentBloc()),
        ],
        child: MaterialApp(
        title: 'Hacker News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF660066),
          accentColor: Color(0xFFba6cba)
        ),
        onGenerateRoute: Router.generateRoute,
      ),
  ),
    );
  }
}