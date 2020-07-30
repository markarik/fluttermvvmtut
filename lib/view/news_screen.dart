import 'package:flutter/material.dart';
import 'package:mvvm/constants/constants.dart';
import 'package:mvvm/viewmodels/news_article_list_view_model.dart';
import 'package:mvvm/widget/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listviewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (value) {
              // _selectCountry(vs, value);
              listviewModel.topCountryHeadlines(Constants.Countries[value]);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.Countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: <Widget>[
                  Text(
                    'News',
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
            Divider(
              height: 40,
              color: Color(0xffFF8A30),
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Row(
                children: <Widget>[
                  Text(
                    'Headline',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: NewsGrid(articles: listviewModel.articles),
            ),
          ],
        ),
      ),
    );
  }
}
