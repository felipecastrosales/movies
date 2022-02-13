import 'package:flutter/widgets.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/repositories/movies_repository.dart';

class MovieController {
  final MoviesRepository _moviesRepository;
  MovieController(this._moviesRepository) {
    fetch();
  }

  ValueNotifier<Movies?> movies = ValueNotifier<Movies?>(null);
  Movies? _chachedMovies;

  onChanged(String value) {
    List<Movie> list = _chachedMovies!.listMovies
        .where(
          (e) => e.toString().toLowerCase().contains(value.toLowerCase()),
        )
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    movies.value = await _moviesRepository.getMovies();
    _chachedMovies = movies.value;
  }
}
