import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presention/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splas_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {

  static const kHomeView='/homeview';
    static const kBookDetailsView='/BookDetailsView';
      static const kSearchView='/SearchView';
 static final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashView(),
    ),

     GoRoute(
      path: kSearchView,
      builder: (context, state) => SearchView(),
    ),


    GoRoute(
      path: kHomeView,
      builder: (context, state) => HomeView(),
    ),
     GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BookDetailsView(),
    ),
  ],
);
  
}