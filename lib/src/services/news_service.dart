import 'package:flutter/material.dart';
import 'package:noticias/src/models/category_model.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const urlNews = 'https://newsapi.org/v2';
const apiKey = '444d4f101f4d4b8b82ca23a901b6fe03';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  String _selectedCategory = 'business';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.futbol, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String,List<Article>> categoryArticles = {};

  NewsService(){
    getTopHeadlines();
    getArticlesByCategory(_selectedCategory);
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory; 

  set selectedCategory(valor){
    _selectedCategory=valor;
    getArticlesByCategory(valor);
    notifyListeners();
  }

  List<Article>? get getArticulosCategoriasSeleccionada => categoryArticles[selectedCategory];


  getTopHeadlines() async {
    final url = Uri.parse('$urlNews/top-headlines?country=us&apiKey=$apiKey');
    
    final resp = await http.get(url);
    final news = newsResponseFromJson(resp.body);
    
    headlines.addAll(news.articles);
    notifyListeners();
    
  }
  getArticlesByCategory(String category) async {

    // if(categoryArticles[category]!.isEmpty){
    //   return categoryArticles[category];
    // }

    final url = Uri.parse('$urlNews/top-headlines?country=us&apiKey=$apiKey&category=$category');
    
    final resp = await http.get(url);
    final news = newsResponseFromJson(resp.body);
    
    categoryArticles[category]?.addAll(news.articles);
    notifyListeners();
    
  }

}