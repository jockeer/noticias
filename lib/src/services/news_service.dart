import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;

const urlNews = 'https://newsapi.org/v2';
const apiKey = '444d4f101f4d4b8b82ca23a901b6fe03';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];

  NewsService(){
    getTopHeadlines();
  }


  getTopHeadlines() async {
    final url = Uri.parse('$urlNews/top-headlines?country=us&apiKey=$apiKey');
    
    final resp = await http.get(url);
    final news = newsResponseFromJson(resp.body);
    
    headlines.addAll(news.articles);
    notifyListeners();
    
  }

}