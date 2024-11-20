import 'package:flutter/material.dart';
import 'package:touille/router.dart';
import 'package:touille/views/nav_bar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = TouilleRouter();

    return MaterialApp(
      //routerConfig: router,
      home: NavBarScreen(router: router),
      title: 'Touille !',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 223, 102, 3),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'BD Supper',
            ),
        useMaterial3: true,
      ),
    );
  }
}
