import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mostre/models/movie.dart';

class MovieProvider extends ChangeNotifier {
  final String apiUrl =
      'https://raw.githubusercontent.com/yudhapest/dummy-api/main/film.json';

  getRecommendedMovie() async {
    var result = await http.get(Uri.parse(apiUrl));
    print(result.statusCode);
    print(result.body);

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Movie> movie = data.map((item) => Movie.fromJson(item)).toList();
      return movie;
    } else {
      return <Movie>[];
    }
  }
}
