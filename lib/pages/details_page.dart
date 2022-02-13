import 'package:flutter/material.dart';

import 'package:movies/models/movies_model.dart';
import 'package:movies/utils/apis_utils.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMG(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      if (progress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                ),
              ),
              Text(movie.overview),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.title),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.new_releases),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      movie.originalTitle,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
