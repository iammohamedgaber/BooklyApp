import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/constans.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: KprimaryColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'GT Sectra Fine'),
        ),
      ),
    );
  }
}
