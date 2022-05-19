import 'package:flutter/material.dart';
import 'package:noticias/src/models/news_models.dart';
import 'package:noticias/src/theme/tema.dart';


class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index){
        return _Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;
  const _Noticia({Key? key, required this.noticia, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetaTopBar(noticia: noticia, index: index,),
        _TarjetaTitulo(noticia: noticia,),
        _TarjetaImagen(noticia: noticia,),
        _TarjetaBody(noticia: noticia,),
        _TarjetaBotones(noticia: noticia,),

        const SizedBox(height: 20,)
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;
  const _TarjetaTopBar({
    Key? key, required this.noticia, required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: TextStyle(color: miTema.primaryColor),),
          Text('${noticia.source.name}. ',style: TextStyle(color: miTema.primaryColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  const _TarjetaTitulo({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
    );
  }
}
class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  const _TarjetaImagen({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
        child: (noticia.url != null) 
          ? FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'),
            image: NetworkImage('${noticia.urlToImage}')
          )
          : const Image(
            image: AssetImage('assets/no-image.png')
          ),
      ),
    );
    
    
  }
}
class _TarjetaBody extends StatelessWidget {
  final Article noticia;
  const _TarjetaBody({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text( noticia.description != null ? '${noticia.description}' :''),
    );
  }
}
class _TarjetaBotones extends StatelessWidget {
  final Article noticia;
  const _TarjetaBotones({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: miTema.primaryColor,
          child: const Icon(Icons.star_border),
        ),
        const SizedBox(width: 20,),
        RawMaterialButton(
          onPressed: (){},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          fillColor: Colors.red,
          child: const Icon(Icons.more),
        ),
      ],
    );
  }
}