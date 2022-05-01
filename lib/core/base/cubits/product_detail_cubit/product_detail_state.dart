part of 'product_detail_cubit.dart';

@immutable
abstract class ProductDetailCubitState {}

class ProductDetailCubitInitial extends ProductDetailCubitState {}

class ProductDetailCubitLoading extends ProductDetailCubitState {}
class ProductDetailCubitCompleted extends ProductDetailCubitState {}

