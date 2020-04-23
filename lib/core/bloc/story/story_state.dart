part of 'story_bloc.dart';

@immutable
abstract class StoryState {}

class StoryInitial extends StoryState {}

class StoryLoading extends StoryState {}

class StoryLoaded extends StoryState {
  final List<TopStorieModel> topStorieModel;

  StoryLoaded([this.topStorieModel = const []]);
}

class StoryNotLoaded extends StoryState{
  final String errorMessage;

  StoryNotLoaded([this.errorMessage = ""]);
}

