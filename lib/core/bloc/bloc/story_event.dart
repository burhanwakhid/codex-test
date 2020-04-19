part of 'story_bloc.dart';

@immutable
abstract class StoryEvent {}

class LoadStory extends StoryEvent{}

class LoadComment extends StoryEvent{
  final List id;

  LoadComment({this.id});
}
