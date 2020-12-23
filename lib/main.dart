import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube_app/screens/home.dart';
import 'package:youtube_app/api.dart';
import 'package:youtube_app/blocs/videos_blocs.dart';
import 'package:youtube_app/blocs/favorites_bloc.dart';

void main() {
  Api api = Api();
  api.search("eletro");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: VideosBloc(),
        child: BlocProvider(
          bloc: FavoriteBloc(),
          child: MaterialApp(
            title: 'FlutterTube',
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          ),
        ));
  }
}
