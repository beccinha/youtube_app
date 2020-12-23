import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_app/blocs/favorites_bloc.dart';
import 'package:youtube_app/models/video.dart';
import 'package:youtube_app/api.dart';

import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorites"),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 4),
          child: StreamBuilder<Map<String, Video>>(
            initialData: {},
            stream: bloc.outFav,
            builder: (context, snapshot) {
              return ListView(
                children: snapshot.data.values.map((v) {
                  return InkWell(
                    onTap: () {
                      FlutterYoutube.playYoutubeVideoById(
                          videoId: v.id, apiKey: API_KEY);
                    },
                    onLongPress: () {
                      bloc.toggleFavorite(v);
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 50,
                          child: Image.network(v.thumb),
                        ),
                        Expanded(
                            child: Text(
                          v.title,
                          style: TextStyle(color: Colors.black87),
                          maxLines: 2,
                        ))
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ));
  }
}
