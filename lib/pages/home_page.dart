import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:movies/controllers/movie_controller.dart';
import 'package:movies/decorators/movies_cache_repository_decorator.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/repositories/movies_repository_impl.dart';
import 'package:movies/service/dio_service_impl.dart';
import 'package:movies/widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = MovieController(
    MoviesCacheRepositoryDecorator(
      MoviesRepositoryImpl(
        DioServiceImpl(),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return Visibility(
                    visible: movies != null,
                    child: Column(
                      children: [
                        Text(
                          'Movies',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          onChanged: _controller.onChanged,
                        ),
                      ],
                    ),
                  );
                },
              ),
              ValueListenableBuilder<Movies?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (_, index) {
                            return CustomListCardWidget(
                              movie: movies.listMovies[index],
                            );
                          },
                        )
                      : Lottie.asset(
                          'assets/lottie.json',
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
