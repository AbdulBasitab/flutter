import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/api_bloc/api_service_bloc.dart';
import 'package:movies_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:movies_app/bloc/watchlist_bloc/watchlist_bloc.dart';
import 'package:movies_app/constants/theme_constants.dart';
import 'package:movies_app/repositories/movie_repository.dart';
import 'package:movies_app/repositories/tv_show_repository.dart';
import 'package:movies_app/screens/splash_screen/splash_screen.dart';
import 'package:movies_app/services/isar_service.dart';
import 'package:movies_app/utils/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServiceLocator();
  await serviceLocator<IsarService>().isarDBInit();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => ApiServiceBloc(
                  movieRepository: serviceLocator<MovieRepository>(),
                  tvShowRepository: serviceLocator<TvShowRepository>(),
                )),
        BlocProvider(
            create: (_) => WatchlistBloc(
                  movieRepository: serviceLocator<MovieRepository>(),
                  tvShowRepository: serviceLocator<TvShowRepository>(),
                )),
        BlocProvider(create: (_) => NavigationBloc()),
      ],
      child: MaterialApp(
        title: "MovieFlix",
        restorationScopeId: 'root',
        color: Colors.white,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme(),
      ),
    );
  }
}
