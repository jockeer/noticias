import 'package:flutter/material.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

import 'package:noticias/src/services/news_service.dart';


class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: newsService.headlines.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
        )
        : ListaNoticias(noticias: newsService.headlines),
    );
  }
}