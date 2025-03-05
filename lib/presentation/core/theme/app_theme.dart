import 'package:flutter/material.dart';
import 'package:pokedex_graphql/presentation/core/theme/colors.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Chakra Petch',
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    surface: AppColors.background
  ),
);
