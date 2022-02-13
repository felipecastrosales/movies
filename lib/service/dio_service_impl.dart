import 'package:dio/dio.dart';

import 'dio_service.dart';

class DioServiceImpl implements DioService {
  final _dio = Dio();

  @override
  // Future<List<Movie>> getMovies() async {
  //   final response = await _dio.get('https://api.themoviedb.org/3/movie/popular?api_key=f7d8d9f8d9f8d9f8d9f8d9f8d9f8d9f8');
  //   return (response.data['results'] as List)
  //       .map((movie) => Movie.fromJson(movie))
  //       .toList();
  Dio getMovies() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZGQ0YTIzZmQ4MDEyOWMzMmIxYzU0ZDZhN2JkYjIyYSIsInN1YiI6IjYxM2VhMTU5OTQ1MGZlMDAyY2FjM2VhZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TQNCYmJvQyvRS-zLF2gBx5sDQ1I86yJD2i0_Nd3e59g',
        },
      ),
    );
  }
}
