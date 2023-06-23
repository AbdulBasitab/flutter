import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/widgets/card_widget.dart';
import '../../../cubit/api_cubit/api_service_bloc.dart';
import '../../../cubit/api_cubit/api_service_cubit_state.dart';
import '../../../cubit/fav_cubit/favourite_cubit.dart';
import '../../movie_screens/movie_detail_screen.dart';

class TrendingMoviesWidget extends StatefulWidget {
  const TrendingMoviesWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<TrendingMoviesWidget> createState() => _TrendingMoviesWidgetState();
}

class _TrendingMoviesWidgetState extends State<TrendingMoviesWidget> {
  @override
  Widget build(BuildContext context) {
    final favCubit = context.watch<FavouriteMoviesShowsCubit>();
    return BlocBuilder<ApiServiceBloc, ApiServiceBloc>(
      builder: (context, state) {
        //   context.read<FetchTrendingMoviesCubit>().fetchTrendingMovies();
        if (state is LoadingMovieState) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TrendingMovieState) {
          final trendingMovies = state.trendingMovies;
          return SliverGrid.builder(
            itemCount: state.trendingMovies.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 140,
              crossAxisSpacing: 30,
              mainAxisSpacing: 11,
              mainAxisExtent: 240,
            ),
            itemBuilder: (BuildContext ctx, index) {
              return Hero(
                tag: 'movieCard$index',
                child: Material(
                  type: MaterialType.transparency,
                  child: MovieTvCardWidget(
                    favCubit: favCubit,
                    fromTrendingMovie: true,
                    trendingMovie: trendingMovies[index],
                    onTap: () {
                      context.read<MovieDetailCubit>().fetchTrendingMovieDetail(
                            trendingMovies[index].id!.toDouble(),
                          );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailPage(
                            movie: trendingMovies[index],
                            heroTag: 'movieCard$index',
                          ),
                        ),
                      );
                    },
                    posterImage:
                        'https://image.tmdb.org/t/p/w500${trendingMovies[index].poster}',
                    onFavouriteTap: () {
                      if (favCubit.isMovieFavorited(trendingMovies[index]) ==
                          true) {
                        favCubit.removeFavMovie(trendingMovies[index]);
                        return;
                      }
                      favCubit.addFavMovie(trendingMovies[index]);
                    },
                  ),
                ),
              );
            },
          );
        } else if (state is ErrorMovieState) {
          SliverToBoxAdapter(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(
            child: Text(state.toString()),
          ),
        );
      },
    );
  }
}
