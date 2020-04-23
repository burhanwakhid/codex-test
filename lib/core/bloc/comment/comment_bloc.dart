import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:codex_test/core/model/comment_model.dart';
import 'package:codex_test/core/service/api_service.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  ApiService _api = ApiService();

  @override
  CommentState get initialState => CommentInitial();

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if(event is LoadComment){
      yield* _mapLoadCommentState(event.id);
    }
  }

  Stream<CommentState> _mapLoadCommentState(List id) async*{
    try{
      yield CommentLoading();

      //call api
      var story = await _api.fetchComment(id);
      yield CommentLoaded(story);
    }catch(e){
      yield CommentNotLoaded(e.toString());
    }
  }
}
