import 'package:flutter/material.dart';
import 'package:mvvm/view/news_article_detail_screen.dart';
import 'package:mvvm/viewmodels/news_article_view_model.dart';
import 'package:mvvm/widget/circle_avatar.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  NewsGrid({this.articles});
  void _showNewsArticleDetails(BuildContext context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(article);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: this.articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];

          return GestureDetector(
            onTap: () {
              _showNewsArticleDetails(context, article);
            },
            child: GridTile(
              child: article.imageUrl != null
                  ? Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: CircleImage(imageUrl: article.imageUrl),
                    )
                  : Container(),
              footer: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    article.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                  )),
            ),
          );
          // Text(listviewModel.articles[index].title);
        });
  }
}
