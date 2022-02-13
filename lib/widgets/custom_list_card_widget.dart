import 'package:flutter/material.dart';
import 'package:movies/models/movies_model.dart';
import 'package:movies/utils/apis_utils.dart';

class CustomListCardWidget extends StatelessWidget {
  const CustomListCardWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.black54,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            API.REQUEST_IMG(
              movie.posterPath,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline6,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    'Popularity: ' + movie.popularity.toString(),
                  ),
                  Text(
                    'Votes: ' + movie.voteAverage.toString(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    //    Text(movie.title))/
  }
}
