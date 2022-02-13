import 'package:movies/models/movies_model.dart';
import 'package:movies/service/dio_service.dart';
import 'package:movies/utils/apis_utils.dart';
import 'movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final DioService _dioService;
  MoviesRepositoryImpl(this._dioService);

  @override
  Future<Movies> getMovies() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);
    return Movies.fromJson(result.data);
  }
}
