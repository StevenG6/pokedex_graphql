part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeStarted extends HomeEvent {}
final class HomeRetryRequested extends HomeEvent {}
final class HomeScrollEndReached extends HomeEvent {}
