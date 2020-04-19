import 'package:codex_test/core/model/comment_model.dart';
import 'package:codex_test/core/model/top_story_model.dart';
import 'package:dio/dio.dart';
import 'dart:async';


class ApiService{
  Dio _dio = Dio();

  Future<dynamic> fetchTopStories() async{
    try{
      var url = 'https://hacker-news.firebaseio.com/v0/topstories.json';
      Response response = await _dio.get(url);
      if(response.statusCode == 200){
        // list id top stories
        List data = response.data;
        List list = await Future.wait(data.sublist(0,11).map((id){
          print('https://hacker-news.firebaseio.com/v0/item/$id.json');
          return _dio.get('https://hacker-news.firebaseio.com/v0/item/$id.json').then((res){
            return res.data;
          });
        }).toList());

        List<TopStorieModel> result = list.map((js) => TopStorieModel.fromJson(js)).toList();
        
        return result;
      }else{
        throw Exception('Oops, Something error');
      }
    }catch(e){
        throw Exception('Oops, Something error: $e');
    }
  }  

  Future<dynamic> fetchComment(List idComment) async{

    try {
      List list = await Future.wait(idComment.map((id){
        return _dio.get('https://hacker-news.firebaseio.com/v0/item/$id.json').then((res){
          return res.data;
        });
      }).toList());

      List<CommentModel> result = list.map((js) => CommentModel.fromJson(js)).toList();
      
      return result;
    } catch (e) {
      throw Exception(e);
    }
    
    
  }  
}