import 'package:flutter/material.dart';
import 'package:pokedex_graphql/presentation/core/theme/app_theme.dart';
import 'package:pokedex_graphql/presentation/home/widgets/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:pokedex_graphql/config/dependencies.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex GraphQL',
      theme: appTheme,
      home: const HomeScreen(),
    );
  }
}
