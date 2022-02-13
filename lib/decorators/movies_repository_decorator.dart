import 'package:movies/models/movies_model.dart';
import 'package:movies/repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  final MoviesRepository _moviesRepository;
  MoviesRepositoryDecorator(this._moviesRepository);

  @override
  Future<Movies> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
