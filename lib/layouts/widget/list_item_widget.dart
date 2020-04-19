import 'package:codex_test/core/model/top_story_model.dart';
import 'package:flutter/material.dart';

class ListItemWIdget extends StatelessWidget {
  final TopStorieModel state;
  final Function onTap;

  const ListItemWIdget({Key key, this.state, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(state.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('by: ${state.by}'),
          Row(
            children: <Widget>[
             (state.kids != null) ? Text('comment: ${state.kids.length.toString()}') :Text("comment: 0"),
              Text('score: ${state.score.toString()}')
            ],
          )
        ],
      ),
    );
  }
}