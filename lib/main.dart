import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/constans.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(HomeRepoImpl(ApiService(Dio()))),
        ),
        BlocProvider(
          create: (context) => NewsetBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,

        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: KprimaryColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'GT Sectra Fine'),
          ),
        ),
      ),
    );
  }
}
