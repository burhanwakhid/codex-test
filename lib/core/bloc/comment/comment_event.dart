part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class LoadComment extends CommentEvent{
  final List id;

  LoadComment({this.id});
}

