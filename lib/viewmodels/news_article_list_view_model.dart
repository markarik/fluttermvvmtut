import 'package:mvvm/model/news_article.dart';
import 'package:mvvm/services/web_service.dart';
import 'package:mvvm/viewmodels/news_article_view_model.dart';
import 'package:flutter/material.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier{

  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();


  void topCountryHeadlines(String country) async {
    List <NewsArticle>newsArticles = await WebService().fetchTopHeadlinesCountry(country);
    notifyListeners();

    this.articles = newsArticles.map((article)=> NewsArticleViewModel(article:article)).toList();
    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
        
  }


  void topHeadlines() async {
    List <NewsArticle>newsArticles = await WebService().fetchTopHeadlines();
    notifyListeners();

    this.articles = newsArticles.map((article)=> NewsArticleViewModel(article:article)).toList();
    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
        
  }
}