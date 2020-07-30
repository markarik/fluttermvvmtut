import 'package:dio/dio.dart';
import 'package:mvvm/constants/constants.dart';
import 'package:mvvm/model/news_article.dart';

class WebService {
  var dio = new Dio();



Future <List<NewsArticle>> fetchTopHeadlinesCountry(String country) async{
  
  final response = await dio.get(Constants.headlinesFor(country));
  if(response.statusCode == 200){
    final result = response.data;
    print(result);

    Iterable list = result['articles'];

    return list.map((article)=>NewsArticle.fromJson(article)).toList();
  }else{
          throw Exception("Failled to get top news");
  }
  
  
  }



  Future <List<NewsArticle>> fetchTopHeadlines() async{
  
  final response = await dio.get(Constants.TOP_HEADLINES_URL);
  if(response.statusCode == 200){
    final result = response.data;
    print(result);

    Iterable list = result['articles'];

    return list.map((article)=>NewsArticle.fromJson(article)).toList();
  }else{
          throw Exception("Failled to get top news");
  }
  
  
  }
}