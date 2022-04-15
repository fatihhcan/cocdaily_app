part of 'product_cubit.dart';

@immutable
abstract class ProductCubitState {}

class ProductCubitInitial extends ProductCubitState {}

class ProductCubitLoading extends ProductCubitState {}
class ProductCubitCompleted extends ProductCubitState {}

