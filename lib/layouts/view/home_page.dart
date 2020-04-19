import 'package:codex_test/core/bloc/bloc/story_bloc.dart';
import 'package:codex_test/core/model/top_story_model.dart';
import 'package:codex_test/layouts/view/detail_story_page.dart';
import 'package:codex_test/layouts/widget/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _favorit = '';
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StoryBloc>(context).add(LoadStory());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Codex'),
      ),
      body: Column(
        children: <Widget>[
          (_favorit != '') ? Text('Favorit: $_favorit') : Text('Anda belum memilih'),
          Expanded(
            child: BlocBuilder<StoryBloc, StoryState>(
              builder: (context, state) {
                if(state is StoryLoaded){
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: state.topStorieModel.length,
                    itemBuilder: (context, index){
                      TopStorieModel topStorieModel = state.topStorieModel[index];
                      return ListItemWIdget(
                        state: topStorieModel,
                        onTap: (){
                          // _navigateToDetailPage(context, topStorieModel);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailStoryPage(topStorieModel: topStorieModel)));
                        },
                      );
                    },
                  );
                }else if(state is StoryLoading){
                  return Center(child: CircularProgressIndicator(),);
                }else if(state is StoryNotLoaded){
                  return Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: Text(state.errorMessage)),
                  );
                }else{
                  return Center(child: Text(""));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _navigateToDetailPage(BuildContext context, TopStorieModel topStorieModel) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailStoryPage(
        topStorieModel: topStorieModel,
      )),
    );

    setState(() {
      _favorit = result;
    });
  }

}

