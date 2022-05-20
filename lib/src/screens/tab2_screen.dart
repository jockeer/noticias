import 'package:flutter/material.dart';
import 'package:noticias/src/models/category_model.dart';
import 'package:noticias/src/services/news_service.dart';
import 'package:noticias/src/theme/tema.dart';
import 'package:noticias/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';


class Tab2Screen extends StatelessWidget {
  const Tab2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             const _ListaCategorias(),
             Expanded(
               child: ListaNoticias(noticias: newService.getArticulosCategoriasSeleccionada!),
             )
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return Container(
      width: double.infinity,
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index){
          final cName = categories[index].name;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _CategoryBotton(category: categories[index]),
                const SizedBox(height: 5,),
                Text(cName[0].toUpperCase() + cName.substring(1), )

              ],
            ),
          );
        },

      ),
    );
  }
}

class _CategoryBotton extends StatelessWidget {
  final Category category;
  const _CategoryBotton({
    Key? key, required this.category
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: (){
        newsService.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white
        ),
        child: Icon(category.icon, color: newsService.selectedCategory==category.name?miTema.primaryColor: Colors.black54,)
      ),
    );
  }
}