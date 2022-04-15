part of 'home_cubit.dart';

@immutable
abstract class HomeCubitState {}

class HomeCubitInitial extends HomeCubitState {}

class HomeCubitLoading extends HomeCubitState {}
class HomeCubitCompleted extends HomeCubitState {}

