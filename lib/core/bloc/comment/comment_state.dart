part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState{}

class CommentLoaded extends CommentState{
  final List<CommentModel> data;

  CommentLoaded([this.data = const [] ]);
}

class CommentNotLoaded extends CommentState{
  final String errorMessage;

  CommentNotLoaded([this.errorMessage = ""]);
}

