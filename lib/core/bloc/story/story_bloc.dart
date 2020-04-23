import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codex_test/core/model/top_story_model.dart';
import 'package:codex_test/core/service/api_service.dart';
import 'package:meta/meta.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  ApiService _api = ApiService();
  @override
  StoryState get initialState => StoryInitial();

  @override
  Stream<StoryState> mapEventToState(
    StoryEvent event,
  ) async* {
    if(event is LoadStory){
      yield* _mapLoadStoryState();
    }
  }

  Stream<StoryState> _mapLoadStoryState() async*{
    try{
      yield StoryLoading();

      //call api
      var story = await _api.fetchTopStories();
      yield StoryLoaded(story);
    }catch(e){
      yield StoryNotLoaded(e.toString());
    }
  }

}
