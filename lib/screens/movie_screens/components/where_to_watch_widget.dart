import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubit/api_cubit/api_service_cubit.dart';
import 'package:movies_app/cubit/api_cubit/api_service_cubit_state.dart';
import 'package:movies_app/widgets/image_widget.dart';

class WhereToWatchWidget extends StatelessWidget {
  const WhereToWatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieWatchProviderCubit, ApiServiceCubit>(
      builder: (context, state) {
        if (state is MovieWatchProviderState) {
          return SizedBox(
            height: 540,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(10),
              children: [
                Visibility(
                  maintainState: true,
                  //  maintainAnimation: true,
                  visible: (state.movieWatchProvider.buyOptions != null)
                      ? true
                      : false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          "Buy",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount:
                              state.movieWatchProvider.buyOptions?.length,
                          itemBuilder: (context, index) {
                            var buyList = state.movieWatchProvider.buyOptions;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      child: ImageWidget(
                                        height: 80,
                                        width: 80,
                                        imageUrl:
                                            "https://image.tmdb.org/t/p/w500${buyList![index].logoPath}",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      buyList[index].providerName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  maintainState: true,
                  // maintainAnimation: true,
                  visible: (state.movieWatchProvider.rentOptions != null)
                      ? true
                      : false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          "Rent",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount:
                              state.movieWatchProvider.rentOptions?.length,
                          itemBuilder: (context, index) {
                            var rentList = state.movieWatchProvider.rentOptions;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      // height: 120,
                                      // width: 110,
                                      child: ImageWidget(
                                          height: 80,
                                          width: 80,
                                          imageUrl:
                                              "https://image.tmdb.org/t/p/w500${rentList![index].logoPath}"),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      rentList[index].providerName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  maintainState: true,
                  maintainAnimation: true,
                  visible: (state.movieWatchProvider.flatrateOptions != null)
                      ? true
                      : false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          "Stream",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(8),
                          itemCount:
                              state.movieWatchProvider.flatrateOptions?.length,
                          itemBuilder: (context, index) {
                            var flatrateList =
                                state.movieWatchProvider.flatrateOptions;
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      // height: 120,
                                      // width: 110,
                                      child: ImageWidget(
                                          height: 80,
                                          width: 80,
                                          imageUrl:
                                              "https://image.tmdb.org/t/p/w500${flatrateList?[index].logoPath}"),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  SizedBox(
                                    width: 90,
                                    child: Text(
                                      flatrateList?[index].providerName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is LoadingMovieState) {
          return const SizedBox(
            height: 90,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is ErrorMovieState) {
          return SizedBox(
            height: 90,
            child: Center(
              child: Text(state.errorMessage, textAlign: TextAlign.center),
            ),
          );
        } else {
          return const SizedBox(
            height: 90,
            child: Center(
              child: Text("Something went wrong,Try Again"),
            ),
          );
        }
      },
    );
  }
}