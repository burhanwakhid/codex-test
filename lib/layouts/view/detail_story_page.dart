import 'package:codex_test/core/bloc/comment/comment_bloc.dart';
import 'package:codex_test/core/bloc/favorit/favorit_bloc.dart';
import 'package:codex_test/core/model/top_story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStoryPage extends StatefulWidget {
  final TopStorieModel topStorieModel;

  const DetailStoryPage({Key key, @required this.topStorieModel}) : super(key: key);
  @override
  _DetailStoryPageState createState() => _DetailStoryPageState();
}

class _DetailStoryPageState extends State<DetailStoryPage> {

  @override
  void initState() {
    BlocProvider.of<CommentBloc>(context).add(LoadComment(id: widget.topStorieModel.kids));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final favoritBloc = BlocProvider.of<FavoritBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite), 
            onPressed: () {
              // favoritBloc.add(SetFavoritEvent(widget.topStorieModel.title));
              BlocProvider.of<FavoritBloc>(context).add(SetFavoritEvent(widget.topStorieModel.title));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(widget.topStorieModel.title),
            Expanded(
              child: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  if(state is CommentLoaded){
                    return ListView.separated(
                      separatorBuilder: (context, index) => Divider(), 
                      itemCount: state.data.length,
                      itemBuilder: (context, index){
                        return ListTile(
                          subtitle: (state.data[index].text.length > 100) ? Text("${state.data[index].text.substring(0, 100)}...") : Text("${state.data[index].text}..."),
                        );
                      }, 
                    );
                  }else if(state is CommentLoading){
                    return Center(child: CircularProgressIndicator());
                  }else if(state is CommentNotLoaded){
                    return Text('${state.errorMessage}');
                  }else{
                    return Container();
                  }
                },
              )
            )
          ],
        ),
      ),
      
    );
  }
}