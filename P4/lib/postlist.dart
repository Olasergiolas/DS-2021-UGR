/*
import 'package:flutter/material.dart';
import 'package:coveet/bd.dart';
import 'package:coveet/widgetpost.dart';

//No la estamos usando. Alternativa a ir cargando los posts con el ListView.builder

class PostList extends StatefulWidget {
  const PostList({Key key}) : super(key: key);

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  List<Widget> cargar_post() {
    List<Widget> widgets = [];
    for (int i = 1; i <= 50; i++) {
      widgets.add(FutureBuilder<Album>(
          future: Album.getAlbum(i.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WidgetPost(
                  snapshot.data.id,
                  snapshot.data.name,
                  snapshot.data.gender,
                  snapshot.data.status,
                  snapshot.data.species,
                  snapshot.data.type);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }));
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: cargar_post(),
    );
  }
}
*/
