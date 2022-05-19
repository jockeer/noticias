import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:noticias/src/services/news_service.dart';
import 'package:noticias/src/screens/tabs_screen.dart';
import 'package:noticias/src/theme/tema.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Noticias App',
        theme: miTema,
        home: const TabsScreen()
      ),
    );
  }
}