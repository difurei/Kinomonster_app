import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:provider/provider.dart';

import '../widgets/trending.dart';

import '../models/favorite.dart';
//api v3 key: 6a0e7cc3038c68e826fe1f25db1b0801
// api request: https://api.themoviedb.org/3/movie/550?api_key=6a0e7cc3038c68e826fe1f25db1b0801
// api v4 token: eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YTBlN2NjMzAzOGM2OGU4MjZmZTFmMjVkYjFiMDgwMSIsInN1YiI6IjYyMzcyNDlmMWRhN2E2MDAxZDY2MDY5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q4oKCxEzzkY-jH1p-6wKugOXpM1V-aXpiWEFfGVAaM0

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List favoriteMovies = [];

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as List;
    var args = Provider.of<FavoritesStore>(context).favoritIDs;
    favoriteMovies = args;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(43, 8, 8, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(125, 0, 0, 1),
        title: const Text("Избранное", style: TextStyle( fontFamily: 'RuslanDisplay', fontSize: 23 )),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: args.length ,itemBuilder: (_, i) => Text(args[i].toString())),
    );
  }
}
