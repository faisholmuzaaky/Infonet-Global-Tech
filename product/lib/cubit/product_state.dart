part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductFailed extends ProductState {
  final String message;
  ProductFailed(this.message);
}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  ProductSuccess(this.products);
}
