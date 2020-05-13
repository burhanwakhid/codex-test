import 'package:codex_test/core/bloc/favorit/favorit_bloc.dart';
import 'package:codex_test/core/bloc/story/story_bloc.dart';
import 'package:codex_test/core/model/top_story_model.dart';
// import 'package:codex_test/layouts/view/coba_page.dart';
import 'package:codex_test/layouts/view/detail_story_page.dart';
import 'package:codex_test/layouts/view/list_item_page.dart';
import 'package:codex_test/layouts/widget/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StoryBloc>(context).add(LoadStory());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Story'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        // return ChangeNotifierProvider<CartModel>(
        //   create: (_) => CartModel(),
        //   child: ListItemPage(),
        // );
        return ListItemPage();
        
      }))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            BlocBuilder<FavoritBloc, String>(
              builder: (context, favorit) {
                return Container(height: 40, child: Text('Favorit: $favorit', style: TextStyle(fontSize: 18),));
              },
            ),
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailStoryPage(topStorieModel: topStorieModel,)));
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
      ),
    );
  }
}

